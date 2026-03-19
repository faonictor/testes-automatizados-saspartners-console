*** Settings ***
Resource   ../resources/navegador.resource
Resource   ../resources/login.resource
Resource   ../resources/jornada_do_paciente.resource
Resource   ../resources/dados_comuns.resource


*** Test Cases ***
Cenário 1 - Login administrador e cadastro paciente rota interna
    [Documentation]    Realiza o cadastro de primeiro acesso de um novo usuário do tipo paciente...
    ...    através da rota de jornada do paciente
    Preencher campos login   ${usuario_joao}    ${senha_joao}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar popups
    Verificar sucesso do login
    Acessar jornada do paciente
    Selecionar cadastrar em jornada do paciente
    Preencher formulário de cadastro paciente parte 1
    Preencher formulário de cadastro paciente parte 2
    Preencher formulário de cadastro paciente parte 3

Cenário 2 - Teste consulta de telessaúde com campos obrigatórios
    [Documentation]    Realiza atendimento de telessaúde para paciente escolhido
    ### Processos de login
    Preencher campos login   ${usuario_joao}    ${senha_joao}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar Popups
    Verificar Sucesso do Login

    ### Processo de buscar paciente
    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${usuario_joao}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista
    
    ### Processo de atendimento telessaúde
    Abrir ficha do paciente
    Enviar mensagem ao paciente pelo whatsapp
    Realizar nova consulta do paciente
    Realizar atendimento telessaúde
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}
    Iniciar videoconferencia com o paciente
    Arrastar caixa de videoconferência  ${para_cima}

    ### Processo de preenchimento de ficha e atendimento do paciente
    Preencher ficha clínica geral - campos Obrigatórios
    Arrastar caixa de videoconferência  ${para_baixo}
    Fechar videoconferencia com o paciente
    Concluir atendimento e fechar ficha
    Preencher box de pesquisa de consulta
    Recusar assinatura digital da ficha médica