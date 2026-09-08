#!/bin/bash
# ===========================================
# Deploiement CRM Pyramidev -> VPS
# ===========================================
# Le build (Angular + Maven) tourne SUR LE VPS, dans le Dockerfile multi-stage.
# On n'envoie que les sources : aucun outil de build necessaire en local.

set -e

VPS_USER="erp-admin"
VPS_IP="37.27.10.140"
VPS_BASE="/home/erp-admin/crm-project"
COMPOSE="docker-compose.prod.yml"
DOMAIN="crm.distrimob.fr"

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_success() { echo -e "${GREEN}OK  $1${NC}"; }
print_error()   { echo -e "${RED}KO  $1${NC}"; }
print_info()    { echo -e "${YELLOW}--> $1${NC}"; }

remote() { ssh "$VPS_USER@$VPS_IP" "$1"; }

sync_sources() {
    print_info "Envoi des sources vers $VPS_BASE ..."
    remote "mkdir -p $VPS_BASE"
    # tar plutot que rsync : rsync n'est pas disponible sous Git Bash Windows.
    tar czf - \
        --exclude='./target' \
        --exclude='./frontend/node_modules' \
        --exclude='./frontend/.angular' \
        --exclude='./frontend/dist' \
        --exclude='./data' \
        --exclude='./.idea' \
        --exclude='./.vscode' \
        --exclude='./.maven' \
        --exclude='./.git' \
        --exclude='./.env' \
        --exclude='*.log' \
        --exclude='./docker-compose.yml.bak' \
        . | remote "tar xzf - -C $VPS_BASE"
    print_success "Sources synchronisees"
}

check_env() {
    if ! remote "test -f $VPS_BASE/.env"; then
        print_error "$VPS_BASE/.env absent sur le VPS"
        echo "  Creer le fichier une seule fois (voir DEPLOY.md, etape 3) :"
        echo "    ssh $VPS_USER@$VPS_IP"
        echo "    cp $VPS_BASE/.env.example $VPS_BASE/.env && nano $VPS_BASE/.env"
        exit 1
    fi
}

build_and_start() {
    print_info "Build de l'image + demarrage des conteneurs (2-4 min la 1re fois) ..."
    remote "cd $VPS_BASE && docker compose -f $COMPOSE up --build -d"
    print_success "Conteneurs demarres"
}

wait_healthy() {
    print_info "Attente du healthcheck applicatif ..."
    for i in $(seq 1 30); do
        STATUS=$(remote "docker inspect -f '{{.State.Health.Status}}' crm-web 2>/dev/null || echo starting")
        if [ "$STATUS" = "healthy" ]; then
            print_success "crm-web est healthy"
            return 0
        fi
        sleep 5
    done
    print_error "crm-web n'est pas healthy apres 150s — voir ./deploy.sh logs"
    return 1
}

case "$1" in
    deploy|"")
        # sync avant check_env : le 1er run depose .env.example sur le VPS,
        # ce qui rend le message d'erreur suivant directement actionnable.
        sync_sources
        check_env
        build_and_start
        wait_healthy
        echo ""
        print_success "Deploye : https://$DOMAIN"
        ;;
    restart)
        remote "cd $VPS_BASE && docker compose -f $COMPOSE restart"
        print_success "Conteneurs redemarres"
        ;;
    stop)
        remote "cd $VPS_BASE && docker compose -f $COMPOSE down"
        print_success "Conteneurs arretes"
        ;;
    logs)
        remote "cd $VPS_BASE && docker compose -f $COMPOSE logs --tail=200 -f web"
        ;;
    status)
        remote "docker ps --filter name=crm- --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"
        ;;
    psql)
        remote "docker exec -it crm-postgres psql -U crm_user -d pyramidev_crm"
        ;;
    *)
        echo "Usage: $0 {deploy|restart|stop|logs|status|psql}"
        echo ""
        echo "  deploy   Envoie les sources, rebuild l'image et redemarre (defaut)"
        echo "  restart  Redemarre sans rebuild"
        echo "  stop     Arrete les conteneurs"
        echo "  logs     Suit les logs applicatifs"
        echo "  status   Etat des conteneurs CRM"
        echo "  psql     Console PostgreSQL du CRM"
        exit 1
        ;;
esac
