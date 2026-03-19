*** Settings ***
Resource    ../resources/login.resource
Resource    ../resources/gestao_de_agenda.resource
Resource    ../resources/sala_de_atendimento.resource
Resource    ../resources/jornada_do_paciente.resource


*** Test Cases ***
Cenário 1 - Criar agenda e agendar paciente para atendimento em sala de espera virtual
    [Documentation]    Cria uma agenda a partir de uma predefinição, 
    ...    agenda um paciente e depois confere o paciente na sala de agendamento

    ### Processos de login
    Preencher campos login   ${usuario_memed}     ${senha_memed}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Confirmar unidade de atendimento após login
    Verificar Sucesso do Login

    ### Processo de criar agenda disponível
    Acessar gestão de agenda
    Selecionar configuração de agenda
    Verificar página de configuração de agenda
    Filtrar configuração de agenda    ${nome_do_profissional.karina_montenegro_tirado}
    Clicar no botão filtrar agenda
    Clicar no botão configurar/publicar agenda
    Selecionar agenda definida
    Preencher configuração de agenda
    Clicar no botão publicar agenda
    Confirmar publicação de agenda

    ### Processo de buscar paciente para agendar
    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${usuario_joao}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista    #${usuario_joao}
    Selecionar agendamento do paciente
    Filtrar configuração de agenda    ${nome_do_profissional.karina_montenegro_tirado}
    Clicar no botão filtrar agenda
    Selecionar data agendamento
    Selecionar profissinal para agendamento    ${agendamento.nome_do_profissional.karina_montenegro_tirado}
    Selecionar horário disponível para agendamento
    Finalizar agendamento

    ### Processo de atendimento em sala de espera virtual
    Acessar sala de atendimento
    Clicar no botão de sala de espera virtual

Cenário 2 - Acessar paciente em sala de espera virtual pela lista de disponibilidade
    [Documentation]    Busca o primeiro paciente disponível na sala de atendimento virtual
    ...    a partir da fila de espera virtual.

    ### Processos de login
    Preencher campos login   ${usuario_memed}     ${senha_memed}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Confirmar unidade de atendimento após login
    Verificar Sucesso do Login

    ### Processo de atendimento em sala de espera virtual
    Acessar sala de atendimento
    Clicar no botão de sala de espera virtual
    Clicar no botão de atender paciente - primeiro disponível

Cenário 3 - Acessar paciente em sala de espera virtual pela data vigente
    [Documentation]    Busca o primeiro paciente disponível na sala de atendimento virtual
    ...    a partir da filtragem da data do dia de busca no calendário e do médico.

    ### Processos de login
    Preencher campos login   ${usuario_memed}     ${senha_memed}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Confirmar unidade de atendimento após login
    Verificar Sucesso do Login

    ### Processo de atendimento em sala de espera virtual
    Acessar sala de atendimento
    Selecionar dia de agendamento da sala de espera
    Acessar prontuário atender paciente - primeiro disponível

Cenário 4 - Atender paciente em sala de espera virtual pela lista de disponibilidade
    [Documentation]    Busca o primeiro paciente disponível na sala de atendimento virtual
    ...    acessa seu prontuário a partir da fila de disponibilidade inicia uma nova consulta de telessaúde 
    ...    preenche a ficha clínica de saúde geral com todos os campos obrigatórios e campos não obrigatórios
    ...    incluindo interconculta.
    
    Preencher campos login   ${usuario_memed}     ${senha_memed}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Confirmar unidade de atendimento após login
    Verificar Sucesso do Login

    ### Processo de atendimento em sala de espera virtual
    Acessar sala de atendimento
    Clicar no botão de sala de espera virtual
    Clicar no botão de atender paciente - primeiro disponível

    ### Processo de Preenchimento de ficha clínica estática - Saúde Geral
    Enviar mensagem ao paciente pelo whatsapp
    Realizar nova consulta do paciente
    Realizar atendimento telessaúde
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}
    Iniciar videoconferencia com o paciente
    Arrastar caixa de videoconferência  ${para_cima}
    Preencher ficha clínica - saúde geral todos os campos
    Arrastar caixa de videoconferência  ${para_baixo}
    Fechar videoconferencia com o paciente    
    Concluir atendimento e fechar ficha
    Preencher box de pesquisa de consulta
    Recusar assinatura digital da ficha médica

Cenário 5 - Atender paciente em sala de espera virtual pela data vigente
    [Documentation]    Busca o primeiro paciente disponível na sala de atendimento virtual
    ...    acessa seu prontuário a partir da data e do médico filtrado e inicia uma nova consulta de telessaúde 
    ...    preenche a ficha clínica de saúde geral com todos os campos obrigatórios e campos não obrigatórios
    ...    incluindo interconculta.
    
    Preencher campos login   ${usuario_memed}     ${senha_memed}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Confirmar unidade de atendimento após login
    Verificar Sucesso do Login

    ### Processo de atendimento em sala de espera virtual
    Acessar sala de atendimento
    Selecionar dia de agendamento da sala de espera
    Acessar prontuário atender paciente - primeiro disponível

    ### Processo de Preenchimento de ficha clínica estática - Saúde Geral
    Enviar mensagem ao paciente pelo whatsapp
    Realizar nova consulta do paciente
    Realizar atendimento telessaúde
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}
    Iniciar videoconferencia com o paciente
    Arrastar caixa de videoconferência  ${para_cima}
    Preencher ficha clínica - saúde geral todos os campos
    Arrastar caixa de videoconferência  ${para_baixo}
    Fechar videoconferencia com o paciente    
    Concluir atendimento e fechar ficha
    Preencher box de pesquisa de consulta
    Recusar assinatura digital da ficha médica

Cenário 6 - Criar uma agenda e agendar paciente e atender pela sala de espera virtual
    [Documentation]    Cria uma agenda a partir de uma predefinição, agenda um paciente e 
    ...    depois confere o paciente na sala de agendamento, busca o primeiro paciente disponível na sala de atendimento virtual
    ...    acessa seu prontuário a partir da fila de disponibilidade inicia uma nova consulta de telessaúde
    ...    preenche a ficha clínica de saúde geral com todos os campos obrigatórios e campos não obrigatórios
    ...    incluindo interconculta.
    
    Preencher campos login   ${usuario_memed}     ${senha_memed}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Confirmar unidade de atendimento após login
    Verificar Sucesso do Login

    ### Processo de criar agenda disponível
    Acessar gestão de agenda
    Selecionar configuração de agenda
    Verificar página de configuração de agenda
    Filtrar configuração de agenda    ${nome_do_profissional.karina_montenegro_tirado}
    Clicar no botão filtrar agenda
    Clicar no botão configurar/publicar agenda
    Selecionar agenda definida
    Preencher configuração de agenda
    Confirmar publicação de agenda

    ### Processo de buscar paciente para agendar
    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${usuario_joao}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista    #${usuario_joao}
    Selecionar agendamento do paciente
    Filtrar configuração de agenda    ${nome_do_profissional.karina_montenegro_tirado}
    Clicar no botão filtrar agenda
    Selecionar data agendamento
    Selecionar profissinal para agendamento    ${agendamento.nome_do_profissional.karina_montenegro_tirado}
    Selecionar horário disponível para agendamento
    Finalizar agendamento

    ### Processo de atendimento em sala de espera virtual
    Acessar sala de atendimento
    Clicar no botão de sala de espera virtual
    Clicar no botão de atender paciente - primeiro disponível

    ### Processo de Preenchimento de ficha clínica estática - Saúde Geral
    Enviar mensagem ao paciente pelo whatsapp
    Realizar nova consulta do paciente
    Realizar atendimento telessaúde
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}
    Iniciar videoconferencia com o paciente
    Arrastar caixa de videoconferência  ${para_cima}
    Preencher ficha clínica - saúde geral todos os campos
    Arrastar caixa de videoconferência  ${para_baixo}
    Fechar videoconferencia com o paciente
    Concluir atendimento e fechar ficha
    Preencher box de pesquisa de consulta
    Recusar assinatura digital da ficha médica

    ### Verifica o Paciente Atendido
    Acessar sala de atendimento
    Clicar no botão de sala de espera virtual