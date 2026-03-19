*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Resource    dados_comuns.resource


*** Variables ***
### Variáveis que estão na tela de relatórios
${menu.relatorios}                                          xpath://a[contains(., 'Relatórios')]
${menu.relatorios.faltas_de_pacientes}                      xpath://span[@class='hide-menu' and text()='Faltas de pacientes']
${menu.relatorios.consulta_por_periodo}                     xpath://span[@class='hide-menu' and text()='Relatório por período']

### Variáveis que estão na tela de consulta por período
${consulta_por_periodo.controle_de_atendimento}             xpath://input[@type='radio' and @value='attendanceControl']
${consulta_por_periodo.dados_de_saude}                      xpath://input[@type='radio' and @value='healthData']
${consulta_por_periodo.agendamento}                         xpath://input[@type='radio' and @value='schedules']
${consulta_por_periodo.tipo_de_seguimento}                  xpath://*[@id="input-selectTipo de seguimento"]//span[@class="dropdown-btn"]
${consulta_por_periodo.tipo_de_seguimento.ambulatorial}     xpath://*[@id="input-selectTipo de seguimento"]//li[.//div[text()="Encaminhamento Ambulatorial"]]
${consulta_por_periodo.tipo_de_seguimento.ps}               xpath://*[@id="input-selectTipo de seguimento"]//li[.//div[text()="Encaminhado PS"]]
${consulta_por_periodo.tipo_de_seguimento.alta}             xpath://*[@id="input-selectTipo de seguimento"]//li[.//div[text()="Alta"]]
${consulta_por_periodo.pedido_de_interconsulta}             xpath://*[@id="input-selectPedido de interconsulta"]//span[@class="dropdown-btn"]
${consulta_por_periodo.pedido_de_interconsulta.sim}         xpath://*[@id="input-selectPedido de interconsulta"]//li[.//div[text()="Sim"]]
${consulta_por_periodo.pedido_de_interconsulta.nao}         xpath://*[@id="input-selectPedido de interconsulta"]//li[.//div[text()="Não"]]
${consulta_por_periodo.data_inicial}                        xpath://input[@formcontrolname='initialDate']
${consulta_por_periodo.data_final}                          xpath://input[@formcontrolname='finalDate']
${consulta_por_periodo.exportar_excel}                      xpath://button[contains(., 'Exportar para Excel')]
${consulta_por_periodo.exportar_pdf}                        xpath://button[contains(., 'Exportar para PDF')]


*** Keywords ***
Acessar relatórios
    Wait Until Element Is Visible    ${menu.relatorios}    ${tempo_padrao}
    Mouse Over    ${menu.relatorios}

Selecionar relatório de falta de paciente
    Wait Until Element Is Visible    ${menu.relatorios.faltas_de_pacientes}    ${tempo_elemento}
    Click Element    ${menu.relatorios.faltas_de_pacientes}
    Sleep    ${tempo_minimo}
    Mouse Over    ${div_header}

Selecionar relatório de consulta por período
    Wait Until Element Is Visible    ${menu.relatorios.consulta_por_periodo}    ${tempo_elemento}
    Click Element    ${menu.relatorios.consulta_por_periodo}
    Sleep    ${tempo_minimo}
    Mouse Over    ${div_header}

Selecionar controle de atendimento
    Scroll Element Into View    ${consulta_por_periodo.controle_de_atendimento}
    Wait Until Element Is Visible    ${consulta_por_periodo.controle_de_atendimento}    ${tempo_elemento}
    Click Element    ${consulta_por_periodo.controle_de_atendimento}

Filtrar controle de atendimento
    Scroll Element Into View    ${consulta_por_periodo.tipo_de_seguimento}
    Wait Until Element Is Visible    ${consulta_por_periodo.tipo_de_seguimento}    ${tempo_elemento}
    Click Element    ${consulta_por_periodo.tipo_de_seguimento}
    Scroll Element Into View    ${consulta_por_periodo.tipo_de_seguimento.alta}
    Wait Until Element Is Visible    ${consulta_por_periodo.tipo_de_seguimento.alta}    ${tempo_elemento}
    Click Element    ${consulta_por_periodo.tipo_de_seguimento.alta}
    Scroll Element Into View    ${consulta_por_periodo.pedido_de_interconsulta}
    Wait Until Element Is Visible    ${consulta_por_periodo.pedido_de_interconsulta}    ${tempo_elemento}
    Click Element    ${consulta_por_periodo.pedido_de_interconsulta}
    Scroll Element Into View    ${consulta_por_periodo.pedido_de_interconsulta.nao}
    Wait Until Element Is Visible    ${consulta_por_periodo.pedido_de_interconsulta.nao}    ${tempo_elemento}
    Click Element    ${consulta_por_periodo.pedido_de_interconsulta.nao}
    Sleep    ${tempo_pausa}

Selecionar intervalo de datas
    [Arguments]    ${dias_iniciais}    ${data_base}=NOW

    IF    '${data_base}'=='NOW'
        ${data_base}=    Get Current Date    result_format=%Y-%m-%d
    ELSE
        ${data_base}=    Set Variable    ${data_base}
    END

    ### Calcula a data inicial a partir da base
    ${data_inicial}=    Subtract Time From Date    ${data_base}    ${dias_iniciais} days    result_format=%d-%m-%Y
    ${data_final}=    Convert Date    ${data_base}    result_format=%d-%m-%Y

    Scroll Element Into View    ${consulta_por_periodo.data_inicial}
    Wait Until Element Is Visible    ${consulta_por_periodo.data_inicial}    ${tempo_padrao}
    Input Text    ${consulta_por_periodo.data_inicial}    ${data_inicial}

    Scroll Element Into View    ${consulta_por_periodo.data_final}
    Wait Until Element Is Visible    ${consulta_por_periodo.data_final}    ${tempo_padrao}
    Input Text    ${consulta_por_periodo.data_final}    ${data_final}

Exportar relatório em PDF
    Scroll Element Into View    ${consulta_por_periodo.exportar_pdf}
    Wait Until Element Is Visible    ${consulta_por_periodo.exportar_pdf}    ${tempo_padrao}
    Click Element    ${consulta_por_periodo.exportar_pdf}
    Sleep    ${tempo_padrao}

Exportar relatório em excel
    Scroll Element Into View    ${consulta_por_periodo.exportar_excel}
    Wait Until Element Is Visible    ${consulta_por_periodo.exportar_excel}    ${tempo_padrao}
    Click Element    ${consulta_por_periodo.exportar_excel}
    Sleep    ${tempo_elemento}
