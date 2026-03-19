*** Settings ***
Library     SeleniumLibrary
Resource    dados_comuns.resource
Resource    navegador.resource


*** Variables ***
### Locators Rotas e Headers Jornada Paciente ###
${menu.sala_de_atendimento}                                                 xpath://a[contains(., 'Sala de Atendimento')]
${sala_de_atendimento.botao_sala_de_espera_virtual}                         xpath://button[contains(text(), 'Sala de espera virtual')]
${tela_lista_consultas_agendadas.botao_usuario_nao_atendido}                xpath:(//button[@id='atender'])[1]    # (//button[contains(., 'Usuário não atendido')])[1]
# ${input_data_sala_espera}    xpath://input[@type="text" and @placeholder="Selecione o dia"]
${sala_de_atendimento.selecione_o_dia.data}                                 xpath://span[contains(@class, 'flatpickr-day') and @aria-current="date"]
${sala_de_atendimento.lista_paciente.botao_prontuario}                      xpath://i[contains(@class, 'mdi mdi-account-card-details')][1]
${sala_de_atendimento.lista_paciente.botao_prontuario.detalhes}             xpath://td//i[contains(@class, 'mdi mdi-clipboard-text')][1]
${sala_de_atendimento.lista_paciente.botao_prontuario.detalhes.fechar}      xpath://button[contains(text(), 'Fechar')]


*** Keywords ***
Acessar sala de atendimento
    Wait Until Element Is Visible    ${menu.sala_de_atendimento}    ${tempo_padrao}
    Click Element    ${menu.sala_de_atendimento}
    Sleep    ${tempo_minimo}
    Mouse Over    ${div_header}
    Sleep    ${tempo_minimo}

Clicar no botão de sala de espera virtual
    Scroll To Top
    Sleep    ${tempo_minimo}
    Wait Until Element Is Visible    ${sala_de_atendimento.botao_sala_de_espera_virtual}
    Click Button    ${sala_de_atendimento.botao_sala_de_espera_virtual}

Clicar no botão de atender paciente - primeiro disponível
    ${botao_existe}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${tela_lista_consultas_agendadas.botao_usuario_nao_atendido}
    ...    ${tempo_padrao}
    IF    ${botao_existe}
        Click Element    ${tela_lista_consultas_agendadas.botao_usuario_nao_atendido}
        Sleep    ${tempo_minimo}
    ELSE
        Log    Nenhum paciente disponível para atendimento.    level=INFO
    END

Selecionar dia de agendamento da sala de espera
    Scroll Element Into View    ${sala_de_atendimento.selecione_o_dia.data}
    Click Element    ${sala_de_atendimento.selecione_o_dia.data}

Acessar prontuário atender paciente - primeiro disponível
    Wait Until Element Is Visible    ${sala_de_atendimento.lista_paciente.botao_prontuario.detalhes}
    Click Element    ${sala_de_atendimento.lista_paciente.botao_prontuario.detalhes}
    Sleep    ${tempo_elemento}
    Click Element    ${sala_de_atendimento.lista_paciente.botao_prontuario.detalhes.fechar}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${sala_de_atendimento.lista_paciente.botao_prontuario}
    Click Element    ${sala_de_atendimento.lista_paciente.botao_prontuario}
