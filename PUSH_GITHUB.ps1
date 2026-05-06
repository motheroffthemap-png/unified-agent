$ErrorActionPreference = "Stop"
$GITHUB_USER = "motheroffthemap-png"
$REPO_NAME   = "unified-agent"
$BRANCH      = "main"
$SOURCE_DIR  = $PSScriptRoot

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  PUSH UNIFIED-AGENT PARA GITHUB" -ForegroundColor Cyan
Write-Host "  Conta: $GITHUB_USER" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "[1/6] Verificando git..." -ForegroundColor Yellow
try {
    $gitVersion = git --version 2>&1
    Write-Host "      OK: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "      ERRO: Git nao encontrado!" -ForegroundColor Red
    Write-Host "      Instale em: https://git-scm.com/download/win" -ForegroundColor White
    Read-Host "Pressione Enter para sair"
    exit 1
}

Write-Host "[2/6] Configurando identidade git..." -ForegroundColor Yellow
Set-Location $SOURCE_DIR
git config user.email "motheroffthemap@gmail.com"
git config user.name "Elle"
Write-Host "      OK" -ForegroundColor Green

Write-Host ""
Write-Host "[3/6] Token do GitHub:" -ForegroundColor Yellow
Write-Host "  Cole o token ghp_ que voce gerou no GitHub" -ForegroundColor White
Write-Host ""
$TOKEN = Read-Host "  Token"

Write-Host ""
Write-Host "[4/6] Criando repositorio no GitHub..." -ForegroundColor Yellow

$headers = @{
    "Authorization" = "token $TOKEN"
    "Accept"        = "application/vnd.github.v3+json"
    "User-Agent"    = "PowerShell"
}

$body = @{
    name        = $REPO_NAME
    description = "Agente unificado Elle - Claude + Manus + Vercel + GitHub"
    private     = $false
    auto_init   = $false
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod `
        -Uri "https://api.github.com/user/repos" `
        -Method POST `
        -Headers $headers `
        -Body $body `
        -ContentType "application/json"
    Write-Host "      OK: $($response.html_url)" -ForegroundColor Green
} catch {
    $statusCode = $_.Exception.Response.StatusCode.value__
    if ($statusCode -eq 422) {
        Write-Host "      Repositorio ja existe - continuando." -ForegroundColor Cyan
    } else {
        Write-Host "      ERRO: $_" -ForegroundColor Red
        Read-Host "Pressione Enter para sair"
        exit 1
    }
}

Write-Host ""
Write-Host "[5/6] Preparando commit..." -ForegroundColor Yellow

if (Test-Path "$SOURCE_DIR\.git") {
    Write-Host "      Git ja inicializado - atualizando." -ForegroundColor Cyan
} else {
    git init
    Write-Host "      git init OK" -ForegroundColor Green
}

git add .
$DATE = Get-Date -Format "yyyy-MM-dd HH:mm"
git commit -m "feat: UNIFIED_AGENT compilado - Claude + Manus + Vercel [$DATE]" 2>&1

git remote remove origin 2>$null
git remote add origin "https://${GITHUB_USER}:${TOKEN}@github.com/${GITHUB_USER}/${REPO_NAME}.git"
Write-Host "      Remote configurado OK" -ForegroundColor Green

Write-Host ""
Write-Host "[6/6] Fazendo push..." -ForegroundColor Yellow
git branch -M $BRANCH
git push -u origin $BRANCH --force

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "  PUSH CONCLUIDO COM SUCESSO!" -ForegroundColor Green
Write-Host ""
Write-Host "  Acesse: https://github.com/$GITHUB_USER/$REPO_NAME" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Read-Host "Pressione Enter para fechar"
