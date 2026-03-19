*** Settings ***
Resource    ../resources/login.resource
Resource    ../resources/jornada_do_paciente.resource


*** Test Cases ***
Cenário 1 - Teste de anexo individual do prontuário do paciente
    [Documentation]    Realiza o test de anexos do prontuário do paciente
    [Setup]    Realizar login
    Pesquisar paciente e abrir prontuario    ${paciente_01}
    Realizar anexos prontuário paciente
    [Teardown]    Fechar navegador de teste

Cenário 2 - Teste de anexos em lote do prontuário do paciente
    [Documentation]    Realiza o test de anexos do prontuário do paciente
    [Setup]    Realizar login
    Pesquisar paciente e abrir prontuario    ${paciente_01}
    Realizar anexos em lote prontuário paciente
    [Teardown]    Fechar navegador de teste

Cenário 3 - Teste anexo ficha clínica - saúde geral
    [Documentation]    Preenche a ficha clínica de saúde geral com os campos obrigatórios para liberar os campos para teste de anexo.
    [Setup]    Realizar login
    Pesquisar paciente e iniciar atendimento    ${usuario_paciente}
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}
    Preencher ficha campos obrigatórios para teste de Anexo    ${saude_geral}
    Realizar anexo ficha clínica
    Finalizar ficha teste de Anexo    ${saude_geral}
    # Fechar box de pesquisa de consulta
    Recusar assinatura digital da ficha médica
    [Teardown]    Fechar navegador de teste

Cenário 4 - Teste anexo ficha clínica - psicologia
    [Documentation]    Preenche a ficha clínica de psicologia com os campos obrigatórios para liberar os campos para teste de anexo.
    [Setup]    Realizar login
    Pesquisar paciente e iniciar atendimento    ${usuario_paciente}
    Selecionar ficha clínica estática    ${ficha_clinica.psicologia}
    Preencher ficha campos obrigatórios para teste de Anexo    ${psicologia}
    Realizar anexo ficha clínica
    Finalizar ficha teste de Anexo    ${psicologia}
    [Teardown]    Fechar navegador de teste

Cenário 5 - Teste anexo ficha clínica - dermatologia
    [Documentation]    Preenche a ficha clínica de dermatologia com os campos obrigatórios para liberar os campos para teste de anexo.
    [Setup]    Realizar login
    Pesquisar paciente e iniciar atendimento    ${usuario_paciente}
    Selecionar ficha clínica estática    ${ficha_clinica.dermatologia}
    Preencher ficha campos obrigatórios para teste de Anexo    ${dermatologia}
    Realizar anexo ficha clínica
    Finalizar ficha teste de Anexo    ${dermatologia}
    Recusar assinatura digital da ficha médica
    [Teardown]    Fechar navegador de teste

Cenário 6 - Teste anexo ficha clínica - odontopediatria
    [Documentation]    Preenche a ficha clínica de odontopediatria com os campos obrigatórios para liberar os campos para teste de anexo.
    [Setup]    Realizar login
    Pesquisar paciente e iniciar atendimento    ${usuario_paciente}
    Selecionar ficha clínica estática    ${ficha_clinica.odontopediatria}
    Preencher ficha campos obrigatórios para teste de Anexo    ${odontopediatria}
    Realizar anexo ficha clínica
    Finalizar ficha teste de Anexo    ${odontopediatria}
    Recusar assinatura digital da ficha médica
    [Teardown]    Fechar navegador de teste

Cenário 7 - Teste anexo ficha clínica - pediatria
    [Documentation]    Preenche a ficha clínica de pediatria com os campos obrigatórios para liberar os campos para teste de anexo.
    [Setup]    Realizar login
    Pesquisar paciente e iniciar atendimento    ${usuario_paciente}
    Selecionar ficha clínica estática    ${ficha_clinica.pediatria}
    Preencher ficha campos obrigatórios para teste de Anexo    ${pediatria}
    Realizar anexo ficha clínica
    Finalizar ficha teste de Anexo    ${pediatria}
    Recusar assinatura digital da ficha médica
    [Teardown]    Fechar navegador de teste

Cenário 8 - Teste anexo ficha dinâmica - formulário completo 09/05
    [Documentation]    Preenche a ficha dinamica do "formulário completo 09/05" com os campos obrigatórios para liberar os campos para teste de anexo.
    [Setup]    Realizar login
    Pesquisar paciente e iniciar atendimento    ${usuario_paciente}
    Selecionar ficha dinâmica    ${ficha_dinamica.completo_09/05}
    Preencher ficha campos obrigatórios para teste de anexo - formulário completo 09/05
    Realizar anexo ficha dinâmica
    Finalizar fichas dinâmicas
    Fechar box de pesquisa de consulta
    Recusar assinatura digital da ficha médica
    [Teardown]    Fechar navegador de teste

Cenário 9 - Teste anexo ficha dinâmica - formulário composto 09/05
    [Documentation]    Preenche a ficha dinamica do "formulário composto 09/05" com os campos obrigatórios para liberar os campos para teste de anexo.
    [Setup]    Realizar login
    Pesquisar paciente e iniciar atendimento    ${usuario_paciente}
    Selecionar ficha dinâmica    ${ficha_dinamica.composto_09/05}
    Preencher ficha campos obrigatórios para teste de anexo - formulário composto 09/05
    Realizar anexo ficha dinâmica
    Finalizar fichas dinâmicas
    Fechar box de pesquisa de consulta
    Recusar assinatura digital da ficha médica
    [Teardown]    Fechar navegador de teste

Cenário 10 - Teste anexo ficha dinâmica - formulário completo obrigatórios
    [Documentation]    Preenche a ficha dinamica do "formulário composto 09/05" com os campos obrigatórios para liberar os campos para teste de anexo.
    [Setup]    Realizar login
    Pesquisar paciente e iniciar atendimento    ${usuario_paciente}
    Selecionar ficha dinâmica    ${ficha_dinamica.completo_obrigatorios}
    Preencher ficha campos obrigatórios para teste de anexo - formulário completo obrigatorios
    Realizar anexo ficha dinâmica
    Finalizar fichas dinâmicas
    Fechar box de pesquisa de consulta
    Recusar assinatura digital da ficha médica
    [Teardown]    Fechar navegador de teste

Cenário 11 - Teste anexo ficha dinâmica - triagem
    [Documentation]    Preenche a ficha dinamica de triagem com os campos obrigatórios para liberar os campos para teste de anexo.
    [Setup]    Realizar login
    Pesquisar paciente e iniciar atendimento    ${usuario_paciente}
    Selecionar ficha dinâmica    ${ficha_dinamica.triagem}
    Preencher ficha campos obrigatórios para teste de anexo - triagem
    Finalizar fichas dinâmicas
    Fechar box de pesquisa de consulta
    Recusar assinatura digital da ficha médica
    [Teardown]    Fechar navegador de teste

Cenário 12 - Teste anexo Multifichas clínicas
    [Documentation]    Preenche a ficha clínica de saúde geral com os campos obrigatórios para liberar os campos para teste de anexo.
    [Setup]    Realizar login
    Realizar anexos multificha e multipaciente    ${paciente_03}    ${ficha_clinica.saude_geral}    ${saude_geral}
    Realizar anexos multificha e multipaciente    ${paciente_03}    ${ficha_clinica.psicologia}    ${psicologia}
    Realizar anexos multificha e multipaciente    ${paciente_03}    ${ficha_clinica.dermatologia}    ${dermatologia}
    Realizar anexos multificha e multipaciente    ${paciente_03}    ${ficha_clinica.odontopediatria}    ${odontopediatria}
    Realizar anexos multificha e multipaciente    ${paciente_03}    ${ficha_clinica.pediatria}    ${pediatria}
    [Teardown]    Fechar navegador de teste

Cenário 13 - Teste anexo multifichas clínicas e multipacientes
    [Documentation]    Preenche a ficha clínica de saúde geral com os campos obrigatórios para liberar os campos para teste de anexo.
    [Setup]    Realizar login
    Realizar anexos multificha e multipaciente    ${paciente_01}    ${ficha_clinica.saude_geral}    ${saude_geral}
    Realizar anexos multificha e multipaciente    ${paciente_02}    ${ficha_clinica.psicologia}    ${psicologia}
    Realizar anexos multificha e multipaciente    ${paciente_03}    ${ficha_clinica.dermatologia}    ${dermatologia}
    Realizar anexos multificha e multipaciente    ${paciente_04}    ${ficha_clinica.odontopediatria}    ${odontopediatria}
    Realizar anexos multificha e multipaciente    ${paciente_05}    ${ficha_clinica.pediatria}    ${pediatria}
    [Teardown]    Fechar navegador de teste

Cenário 14 - Teste anexos rota dashboard para paciente logado
    [Documentation]    Acesa a rota do dashboard para teste de anexo do paciente logado.
    [Setup]    Realizar login
    Acessar rota do dashboard
    Realizar anexos em lote prontuário paciente
    [Teardown]    Fechar navegador de teste

Cenário 15 - Teste anexo de exames solicitar interconsultas
    [Documentation]    Preenche a ficha clínica de saúde geral com os campos obrigatórios 
    ...    e solicita interconsultas com adição de exames anexados
    [Setup]    Realizar login
    Pesquisar paciente e iniciar atendimento    ${usuario_paciente}
    Selecionar ficha clínica estática    ${ficha_clinica.saude_geral}
    Preencher ficha campos obrigatórios para teste de Anexo    ${saude_geral}
    Solicitar Interconsulta e testa anexar exames
    Finalizar ficha teste de Anexo    ${saude_geral}
    Recusar assinatura digital da ficha médica
    Acessar interconsultas
    Selecionar minhas interconsultas
    Encontrar paciente em lista de interconsultas
    [Teardown]    Fechar navegador de teste