*** Settings ***
Resource    ../resources/login.resource
Resource    ../resources/jornada_do_paciente.resource

*** Test Cases ***
Cenário 1 - Preencher ficha clínica - Saúde Geral - campos obrigatórios
    [Documentation]    Preenche a ficha clínica de saúde geral somente dos campos obrigatórios.
    Preencher campos login    ${usuario_memed}    ${senha_memed}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Confirmar unidade de atendimento após login
    Verificar Sucesso do Login

    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${paciente_masculino_cpf}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista
    Abrir ficha do paciente
    Realizar nova consulta do paciente
    Realizar atendimento telessaúde

    ### Processo de Preenchimento de ficha clínica estática - Saúde Geral
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}
    Preencher ficha clínica geral - campos obrigatórios
    Concluir atendimento e fechar ficha
    Preencher box de pesquisa de consulta
    Recusar assinatura digital da ficha médica
    

Cenário 3 - Preencher ficha clínica - Saúde Geral - completo
    [Documentation]    Preenche a ficha clínica de saúde geral com todos os campos obrigatórios e 
    ...    campos não obrigatórios junto com atendimento teleconsuta e anexos.
    Preencher campos login    ${usuario_memed}    ${senha_memed}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Confirmar unidade de atendimento após login
    Verificar Sucesso do Login

    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${paciente_masculino_cpf}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista
    Abrir ficha do paciente

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

Cenário 3 - Preencher ficha dinâmica - formulário completo obrigatório
    [Documentation]    Preenche a ficha dinâmica de teste com todos os campos obrigatórios.
    Preencher campos login    ${usuario_memed_feminino}    ${senha_memed}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Confirmar unidade de atendimento após login
    Verificar Sucesso do Login

    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${paciente_masculino_cpf}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista
    Abrir ficha do paciente
    Realizar nova consulta do paciente
    Realizar atendimento telessaúde

    ### Processo de Preenchimento de ficha dinâmica de teste
    Selecionar ficha dinâmica    ${ficha_dinamica.completo_obrigatorios}
    Preencher ficha dinamica - formulario completo obrigatórios
    Recusar assinatura digital da ficha médica