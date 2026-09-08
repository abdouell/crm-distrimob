# run_local.ps1
# Script utilitaire pour télécharger Maven localement et exécuter l'application Spring Boot

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$MavenDir = Join-Path $ScriptDir ".maven"
$MavenZip = Join-Path $ScriptDir "maven.zip"
$MavenExecutable = Join-Path $MavenDir "apache-maven-3.9.6\bin\mvn.cmd"

# 1. Vérification / Téléchargement de Maven
if (-not (Test-Path $MavenExecutable)) {
    Write-Host "Maven local non trouvé. Téléchargement de Apache Maven 3.9.6..." -ForegroundColor Cyan
    if (-not (Test-Path $MavenDir)) {
        New-Item -ItemType Directory -Path $MavenDir | Out-Null
    }
    
    $Url = "https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip"
    
    try {
        Invoke-WebRequest -Uri $Url -OutFile $MavenZip -UserAgent "Mozilla/5.0"
        Write-Host "Téléchargement terminé. Extraction de l'archive..." -ForegroundColor Cyan
        Expand-Archive -Path $MavenZip -DestinationPath $MavenDir -Force
        Remove-Item -Path $MavenZip -Force
        Write-Host "Maven installé avec succès dans $MavenDir" -ForegroundColor Green
    } catch {
        Write-Error "Échec du téléchargement ou de l'extraction de Maven: $_"
        exit 1
    }
}

# 2. Exécution de la commande demandée (par défaut clean spring-boot:run)
$ArgsList = $args
if ($ArgsList.Length -eq 0) {
    $ArgsList = @("clean", "spring-boot:run")
}

Write-Host "Exécution de Maven: mvn $ArgsList" -ForegroundColor Yellow
& $MavenExecutable $ArgsList
