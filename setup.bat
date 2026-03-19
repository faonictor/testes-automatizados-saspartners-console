@echo off
chcp 65001 > nul
title Execução de Testes Automatizados

echo =================================================
echo  Projeto de Testes Automatizados - Sias Partners
echo =================================================

REM 1. Criar ambiente virtual, se não existir
IF NOT EXIST venv (
    echo Criando ambiente virtual...
    python -m venv venv
)

REM 2. Ativar o ambiente virtual
echo Ativando ambiente virtual...
call venv\Scripts\activate

REM 3. Atualizar pip e instalar dependências
echo Atualizando pip...
python -m pip install --upgrade pip

echo Instalando dependências...
pip install -r drivers\requirements.txt

REM 4. Executar script interativo
echo Iniciando menu interativo...
python resources\scripts\menu_console_interativo.py

REM 5. Finalizar
echo ======================
echo  Execução finalizada!
echo ======================
pause