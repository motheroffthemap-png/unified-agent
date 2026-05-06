@echo off
TITLE Push unified-agent para GitHub
echo.
echo ============================================
echo  PUSH UNIFIED-AGENT PARA GITHUB
echo  Conta: motheroffthemap-png
echo ============================================
echo.

REM --- CONFIGURACOES ---
set REPO_NAME=unified-agent
set GITHUB_USER=motheroffthemap-png
set BRANCH=main

REM --- PASTA ONDE ESTAO OS ARQUIVOS ---
set SOURCE_DIR=%~dp0

echo [1/5] Configurando pasta do projeto...
cd /d "%SOURCE_DIR%"

echo [2/5] Inicializando git...
git init
git config user.email "motheroffthemap@gmail.com"
git config user.name "Elle"

echo [3/5] Adicionando todos os arquivos...
git add .
git commit -m "feat: MASTER_AGENT compilado de 27 sessoes Claude - $(date /t)"

echo [4/5] Conectando ao repositorio GitHub...
echo.
echo ATENCAO: Voce precisara:
echo   1. Criar o repositorio '%REPO_NAME%' em https://github.com/new
echo   2. Ter um Personal Access Token do GitHub
echo      (GitHub -> Settings -> Developer settings -> Personal access tokens)
echo.
echo Quando tiver o token, o remote sera:
echo   https://%GITHUB_USER%:SEU_TOKEN@github.com/%GITHUB_USER%/%REPO_NAME%.git
echo.

set /p TOKEN=Cole seu GitHub Personal Access Token aqui:
git remote add origin https://%GITHUB_USER%:%TOKEN%@github.com/%GITHUB_USER%/%REPO_NAME%.git

echo [5/5] Fazendo push...
git branch -M %BRANCH%
git push -u origin %BRANCH%

echo.
echo ============================================
echo  CONCLUIDO! Acesse:
echo  https://github.com/%GITHUB_USER%/%REPO_NAME%
echo ============================================
echo.
pause
