*** Settings ***
Resource   ../resources/navegador.resource
Resource    ../resources/login.resource
Resource    ../resources/relatorios.resource
Resource    ../resources/dados_comuns.resource


*** Test Cases ***
Cenário 1 - Acessar relatório de faltas
    [Documentation]    Acessar relatório de pacientes com faltantes
    ### Processos de login
    Preencher campos login   ${usuario_admin}    ${senha_admin}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Acessar relatório de faltas
    Acessar relatórios
    Selecionar relatório de falta de paciente

Cenário 2 - Acessar e exportar relatório de controle de atendimento - PDF 15 dias
    [Documentation]    Extrai relatório do controle de atendimento para 15 dias e exporta em PDF
    ### Processos de login
    Preencher campos login   ${usuario_admin}    ${senha_admin}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Acessar relatório de controle de atendimento
    Acessar relatórios
    Selecionar relatório de consulta por período
    # Filtrar controle de atendimento
    Selecionar intervalo de datas    ${15_dias}    #${data_base}
    Exportar relatório em PDF

Cenário 2 - Acessar e exportar relatório de controle de atendimento - Excel 7 dias
    [Documentation]    Extrai relatório do controle de atendimento para 7 dias e exporta em Excel
    ### Processos de login
    Preencher campos login   ${usuario_admin}    ${senha_admin}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Acessar relatório de controle de atendimento
    Acessar relatórios
    Selecionar relatório de consulta por período
    # Filtrar controle de atendimento
    Selecionar intervalo de datas    ${7_dias}    #${data_base}
    Exportar relatório em excel