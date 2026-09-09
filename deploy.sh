#!/bin/bash
# ===========================================
# Deploiement CRM Pyramidev -> VPS
# ===========================================
# UN SEUL SCRIPT pour tout deployer. Le Dockerfile est multi-stage :
#   1. node  compile le frontend Angular
#   2. maven compile le backend et embarque le build Angular dans le JAR
#   3. Spring Boot sert la SPA ET l'API sur le meme port
# Backend et frontend partent donc ensemble : `./deploy.sh` suffit.
#
# Le build tourne SUR LE VPS : aucun JDK, Maven ou Node requis en local.

set -e

VPS_USER="erp-admin"
VPS_IP="37.27.10.140"
VPS_BASE="/home/erp-admin/crm-project"
COMPOSE="docker-compose.prod.yml"
DOMAIN="crm.distrimob.fr"

GREEN='\033[0;32m'; RED='\033[0;31m'; YELLOW='\033[1;33m'; NC='\033[0m'
print_success() { echo -e "${GREEN}OK  $1${NC}"; }
print_error()   { echo -e "${RED}KO  $1${NC}"; }
print_info()    { echo -e "${YELLOW}--> $1${NC}"; }

remote() { ssh "$VPS_USER@$VPS_IP" "$1"; }

deploy() {
    # --- 1. envoi des sources (tar plutot que rsync, absent de Git Bash Windows) ---
    print_info "1/4 Envoi des sources vers $VPS_BASE ..."
    remote "mkdir -p $VPS_BASE"
    tar czf - \
        --exclude='./target' \
        --exclude='./frontend/node_modules' \
        --exclude='./frontend/.angular' \
        --exclude='./frontend/dist' \
        --exclude='./data' \
        --exclude='./csv' \
        --exclude='./import' \
        --exclude='./.idea' \
        --exclude='./.vscode' \
        --exclude='./.maven' \
        --exclude='./.git' \
        --exclude='./.env' \
        --exclude='*.log' \
        --exclude='./docker-compose.yml.bak' \
        . | remote "tar xzf - -C $VPS_BASE"
    print_success "Sources synchronisees"

    # --- 2. le .env de prod ne quitte jamais le serveur ---
    print_info "2/4 Verification du .env de production ..."
    if ! remote "test -f $VPS_BASE/.env"; then
        print_error "$VPS_BASE/.env absent sur le VPS"
        echo "  A creer une seule fois (voir DEPLOY.md, etape 3) :"
        echo "    ssh $VPS_USER@$VPS_IP"
        echo "    cp $VPS_BASE/.env.example $VPS_BASE/.env && nano $VPS_BASE/.env"
        exit 1
    fi
    print_success ".env present"

    # --- 3. build Angular + Maven puis demarrage, le tout dans Docker ---
    print_info "3/4 Build frontend + backend et demarrage (2-4 min la 1re fois) ..."
    remote "cd $VPS_BASE && docker compose -f $COMPOSE up --build -d"
    print_success "Conteneurs demarres"

    # --- 4. l'app est-elle vraiment en ligne ? ---
    print_info "4/4 Attente du healthcheck applicatif ..."
    for _ in $(seq 1 30); do
        STATUS=$(remote "docker inspect -f '{{.State.Health.Status}}' crm-web 2>/dev/null || echo starting")
        if [ "$STATUS" = "healthy" ]; then
            print_success "crm-web est healthy"
            echo ""
            print_success "Deploye : https://$DOMAIN"
            return 0
        fi
        sleep 5
    done
    print_error "crm-web n'est pas healthy apres 150s — voir ./deploy.sh logs"
    return 1
}

case "$1" in
    deploy|"") deploy ;;
    restart)   remote "cd $VPS_BASE && docker compose -f $COMPOSE restart" && print_success "Redemarre" ;;
    stop)      remote "cd $VPS_BASE && docker compose -f $COMPOSE down" && print_success "Arrete" ;;
    logs)      remote "cd $VPS_BASE && docker compose -f $COMPOSE logs --tail=200 -f web" ;;
    status)    remote "docker ps --filter name=crm- --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'" ;;
    psql)      remote "docker exec -it crm-postgres psql -U crm_user -d pyramidev_crm" ;;
    *)
        echo "Usage: $0 {deploy|restart|stop|logs|status|psql}"
        echo ""
        echo "  deploy   Deploie TOUT : frontend Angular + backend Spring Boot (defaut)"
        echo "  restart  Redemarre sans rebuild"
        echo "  stop     Arrete les conteneurs"
        echo "  logs     Suit les logs applicatifs"
        echo "  status   Etat des conteneurs CRM"
        echo "  psql     Console PostgreSQL du CRM"
        echo ""
        echo "Import de l'historique LinkedIn : ./import-linkedin.sh (script separe)"
        exit 1
        ;;
esac
