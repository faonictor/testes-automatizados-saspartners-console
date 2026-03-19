*** Settings ***
Resource    ../resources/navegador.resource
Resource    ../resources/login.resource
Resource    ../resources/gestao_de_agenda.resource
Resource    ../resources/jornada_do_paciente.resource
Resource    ../resources/relatorios.resource
Resource    ../resources/dados_comuns.resource


*** Test Cases ***
Cenário 1 - Criar uma agenda
    [Documentation]    Realiza a criação de uma nova agenda a partir de uma predefeinição de agenda existente
    ### Processos de login
    Preencher campos login   ${usuario_joao}    ${senha_joao}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Processo de acessar rota agenda
    Acessar gestão de agenda
    Selecionar configuração de agenda
    Verificar página de configuração de agenda

    ### Processo de filtrar e criar agenda
    Filtrar configuração de agenda    ${nome_do_profissional.profissional_requisitado}
    Clicar no botão filtrar agenda
    Clicar no botão configurar/publicar agenda
    Selecionar agenda definida
    Preencher configuração de agenda
    Clicar no botão publicar agenda
    Confirmar publicação de agenda

Cenário 2 - Realizar agendamento de paciente
    [Documentation]    Realiza o agendamento de uma consulta de paciente para horários disponíveis
    ### Processos de login
    Preencher campos login   ${usuario_joao}    ${senha_joao}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Processo de buscar paciente para agendar
    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${usuario_joao}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista    #${usuario_joao}
    Selecionar agendamento do paciente
    Filtrar configuração de agenda    ${nome_do_profissional.profissional_requisitado}
    Clicar no botão filtrar agenda

    ### Selecionar data disponível
    Selecionar data agendamento
    Selecionar profissinal para agendamento    ${nome_do_profissional.profissional_requisitado}
    Selecionar horário disponível para agendamento
    Finalizar agendamento

Cenário 3 - Cancelar agendamento de paciente pela rota de agenda
    [Documentation]    Realiza o cancelamento de um agendamento de consulta de paciente pela rota de agenda
    ### Processos de login
    Preencher campos login   ${usuario_joao}    ${senha_joao}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Processo de acessar rota agenda
    Acessar gestão de agenda
    Selecionar configuração de agenda
    Verificar página de configuração de agenda

    ### Processo de buscar paciente agendado para cancelar
    Filtrar configuração de agenda    ${nome_do_profissional.profissional_requisitado}
    Clicar no botão filtrar agenda
    Selecionar data agendamento
    Selecionar profissinal para agendamento    ${nome_do_profissional.profissional_requisitado}
    Excluir paciente agendado
    Confirmar exclusão de paciente agendado

Cenário 4 - Cancelar agendamento de paciente pela rota de unidades de atendimento
    [Documentation]    Realiza o cancelamento de um agendamento de consulta de paciente pela rota de consulta 
    ...    de unidades de atendimento
    ### Processos de login
    Preencher campos login   ${usuario_joao}    ${senha_joao}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Processo de acessar rota agenda
    Acessar gestão de agenda
    Selecionar configuração de agenda
    Verificar página de configuração de agenda

    ### Processo de consultar unidade de atendimento e excluir consulta agendada
    Clicar no botão consultar unidades de atendimento
    Filtrar unidades de atendimento
    Selecionar paciente e excluir consulta agendada
    Confirmar exclusão de paciente agendado
    
Cenário 5 - Informar falta de paciente agendado pela rota de agenda
    [Documentation]    Informa a falta de um paciente para uma consulta agendada
    ### Processos de login
    Preencher campos login   ${usuario_joao}    ${senha_joao}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Processo de acessar rota agenda
    Acessar gestão de agenda
    Selecionar configuração de agenda
    Verificar página de configuração de agenda

    ### Processo de buscar paciente agendado para informar falta
    Filtrar configuração de agenda    ${nome_do_profissional.profissional_requisitado}
    Clicar no botão filtrar agenda
    Selecionar data agendamento
    Selecionar profissinal para agendamento    ${nome_do_profissional.profissional_requisitado}
    Acessar prontuário de paciente agendado

    ### Realizar atendimento inicial de telessaúde
    Realizar nova consulta do paciente
    Realizar atendimento telessaúde
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}

    ### Processo de informar falta de paciente
    Informar falta de paciente
    
    ### Acessar relatório de faltas
    Acessar relatórios
    Selecionar relatório de falta de paciente

Cenário 6 - Informar falta de paciente pela rota de unidades de atendimento
    [Documentation]    Realiza o cancelamento de um agendamento de consulta de paciente pela rota de consulta 
    ...    de unidades de atendimento
    ### Processos de login
    Preencher campos login   ${usuario_joao}    ${senha_joao}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Processo de acessar rota agenda
    Acessar gestão de agenda
    Selecionar configuração de agenda
    Verificar página de configuração de agenda

    ### Processo de consultar unidade de atendimento e excluir consulta agendada
    Clicar no botão consultar unidades de atendimento
    Filtrar unidades de atendimento
    Selecionar paciente e acessar fichas de prontuário
    Realizar nova consulta do paciente
    Realizar atendimento telessaúde
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}
    Informar falta de paciente
    ### Confirmar exclusão de paciente agendado #(modal de confirmação não aparece mais)

    ### Acessar relatório de faltas
    Acessar relatórios
    Selecionar relatório de falta de paciente

Cenário 7 - Informar falta de pacientes sem agendamento - por sexo
    [Documentation]    Informa a falta de um paciente para uma consulta agendada
    ### Processos de login
    Preencher campos login   ${usuario_joao}    ${senha_joao}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Processo de buscar paciente para informar falta paciente feminino
    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${paciente_feminino_cpf}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista
    Abrir ficha do paciente
    Realizar nova consulta do paciente
    Realizar atendimento telessaúde
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}
   
    Informar falta de paciente

    ### Processo de buscar paciente para informar falta paciente masculino
    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${paciente_masculino_cpf}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista
    Abrir ficha do paciente
    Realizar nova consulta do paciente
    Realizar atendimento telessaúde
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}
    Informar falta de paciente

    ### Processo de buscar paciente para informar falta paciente masculino
    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${paciente_naoinformar_cpf}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista
    Abrir ficha do paciente
    Realizar nova consulta do paciente
    Realizar atendimento telessaúde
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}
    Informar falta de paciente

    ### Acessar relatório de faltas
    Acessar relatórios
    Selecionar relatório de falta de paciente

Cenário 8 - Informar falta de paciente sem agendamento - presencial
    [Documentation]    Informa a falta de um paciente para uma consulta agendada
    ### Processos de login
    Preencher campos login   ${usuario_joao}    ${senha_joao}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Processo de buscar paciente para informar falta paciente feminino
    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${paciente_feminino_cpf}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista
    Abrir ficha do paciente
    Realizar nova consulta do paciente
    Realizar atendimento presencial
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}
    Informar falta de paciente
    
    ### Acessar relatório de faltas
    Acessar relatórios
    Selecionar relatório de falta de paciente

Preencher uma agenda com modelo predefinido [MODELO DE TESTES AUTOMATIZADOS]
    Preencher campos login   ${usuario_joao}    ${senha_joao}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Processo de acessar rota agenda
    Acessar gestão de agenda
    Selecionar configuração de agenda
    Verificar página de configuração de agenda

    ### Processo de filtrar e criar agenda
    Filtrar configuração de agenda    ${nome_do_profissional.profissional_requisitado}
    Clicar no botão filtrar agenda
    Clicar no botão configurar/publicar agenda
    Selecionar agenda definida
    Carregar modelo de agenda    ${modelo_agenda.modelo_de_testes_automatizados}
    Preencher agenda com modelo
    Clicar no botão publicar agenda
    Confirmar publicação de agenda