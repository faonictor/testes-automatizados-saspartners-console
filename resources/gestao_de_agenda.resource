*** Settings ***
Documentation       Este arquivo contém tudo relacionado aos processos da aba e telas de gestão de agenda.

Library             SeleniumLibrary
Library             DateTime
Library             String
Resource            dados_comuns.resource
Resource            navegador.resource


*** Variables ***
### Variáveis que estão na barra de menu na aba de gestao de agenda
${menu.gestao_de_agenda}                                                                            xpath://a[contains(., 'Gestão de Agenda')]
${menu.gestao_de_agenda.configuracao_de_agenda}                                                     xpath://span[@class='hide-menu' and text()='Configuração de agenda']

${configuracao_de_agenda.botao_configurar_publica_agenda}                                           xpath://button[contains(text(), ' Configurar/Publicar agenda')]
${configuracao_de_agenda.botao_consutar_unidades_de_atendimento}                                    xpath://button[contains(text(), 'Consultar unidades de atendimento')]

### Variáveis que estão na tela de sala de atendimento e agenda
${gestao_de_agenda.configuracao_de_agenda.titulo}                                                   xpath://h4[@class='page-title' and text()='Sala de atendimento e agenda']
${configuracao_de_agenda.unidade_de_atendimento}                                                    xpath://*[@id="input-selectSelecione uma unidade de atendimento"]//span[@class='dropdown-btn']
${configuracao_de_agenda.unidade_de_atendimento.smart}                                              xpath://li[.//div[text()='TELESSAÚDE SUS']]
${configuracao_de_agenda.profissao}                                                                 xpath://*[@id="input-selectProfissão"]//span[@class='dropdown-btn']
${configuracao_de_agenda.profissao.medico}                                                          xpath://li[.//div[text()='MÉDICO']]
${configuracao_de_agenda.especialidade}                                                             xpath://*[@id="input-selectEspecialidade"]//span[@class='dropdown-btn']
${configuracao_de_agenda.especialidade.ginecologia_e_obstetricia}                                   xpath://li[.//div[text()='GINECOLOGIA E OBSTETRÍCIA']]
${configuracao_de_agenda.nome_do_profissional}                                                      xpath://*[@id="input-selectNome do profissional"]//span[@class='dropdown-btn']
${nome_do_profissional.profissional_requisitado}                                                    xpath://li[.//div[text()='PROFISSIONAL REQUISITADO']]
${nome_do_profissional.karina_montenegro_tirado}                                                    xpath://li[.//div[text()='KARINA MONTENEGRO TIRADO']]
${agendamento.nome_do_profissional.karina_montenegro_tirado}                                        xpath:(//li[.//div[text()='KARINA MONTENEGRO TIRADO']])[2]
${configuracao_de_agenda.filtrar_profissional}                                                      xpath://button[contains(text(), 'Filtrar profissional')]    ### //button[text()=" Filtrar profissional"]

### Variáveis que estão na tela de publicar agenda e escala
${tela_publicar_agenda}                                                                             xpath://div[contains(@class, 'modal-content')]
${tela_publicar_agenda.escala_vinculada.smart.botao_selecionar}                                     xpath://tr[td[normalize-space()="TELESSAÚDE SUS"]]//button[normalize-space()="Selecionar"]
${tela_publicar_agenda.lista_publicada}                                                             xpath://button[contains(text(), 'Lista publicada')]
${tela_publicar_agenda.carregar_modelo}                                                             xpath://button[contains(text(), 'Modelos prontos')]
${modelo_agenda.modelo_de_testes_automatizados}                                                     xpath://tr[td[normalize-space()="MODELO DE TESTES AUTOMATIZADOS"]]//button[normalize-space()="Carregar"]
${tela_publicar_agenda.carregar_modelo.fechar}                                                      xpath://button[contains(text(), 'Fechar')]
${tela_publicar_agenda.linha_de_cuidado}                                                            xpath://*[@id="input-selectLinha de cuidado"]//span[@class='dropdown-btn']
${tela_publicar_agenda.linha_de_cuidado.saude_do_idoso}                                             xpath://li[.//div[text()='SAÚDE DO IDOSO']]
${tela_publicar_agenda.tipo_de_atendimento}                                                         xpath://*[@id="input-selectTipo de atendimento"]//span[@class='dropdown-btn']
${tela_publicar_agenda.tipo_de_atendimento.atendimentos_por_chat}                                   xpath://li[.//div[text()='ATENDIMENTOS POR CHAT']]
${tela_publicar_agenda.procedimento}                                                                xpath://*[@id="input-selectQual procedimento"]//span[@class='dropdown-btn']
${tela_publicar_agenda.procedimento.laboratorial}                                                   xpath:(//li[.//div[text()="LABORATORIAL UM"]])[2]

${tela_publicar_agenda.data_e_hora.inicio}                                                          xpath://*[@id="input-selectHora Início"]//span[@class='dropdown-btn']
${tela_publicar_agenda.data_e_hora.inicio.hora.14:30}                                               xpath://li[.//div[text()='14:30']]
${tela_publicar_agenda.data_e_hora.inicio.hora.7:00}                                                xpath://li[.//div[text()='07:00']]
${tela_publicar_agenda.data_e_hora.quantidade_de_pacientes}                                         xpath://*[@id="input-text-Quantidade de pacientes *"]
${tela_publicar_agenda.data_e_hora.fim}                                                             xpath://*[@id="input-selectHora Fim"]//span[@class='dropdown-btn']
${tela_publicar_agenda.data_e_hora.fim.hora.8:40}                                                   xpath://li[.//div[text()='08:40']]
${tela_publicar_agenda.data_e_hora.disponibilidade_recorrente}                                      xpath://label[@for="input-checkbox-recurring"]

${tela_pubicar_agenda.data_e_hora.selecione_o_dia}                                                  xpath:(//input[@type="text" and @placeholder="Selecione o dia"])[2]
${tela_pubicar_agenda.data_e_hora.selecione_o_dia.data}                                             xpath:(//span[contains(@class, 'flatpickr-day') and @aria-current="date"])[2]

${tela_publicar_agenda.data_e_hora.recorrente_ate}                                                  xpath:(//input[@type='text' and @readonly='readonly'])[2]
${tela_publicar_agenda.data_e_hora.recorrente_ate.dia}                                              xpath:(//span[contains(@class, 'flatpickr-day') and @aria-current="date"])[2]

${tela_publicar_agenda.publicacao_agenda.disponivel_para_unidades.nao}                              xpath://*[@id="availableToOtherEstablishments"]/label[1]
${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.nao}                       xpath://*[@id="isTeleconsulting"]/label[1]
${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.sim}                       xpath://*[@id="isTeleconsulting"]/label[2]
${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.sim.tipo}                  xpath://*[@id="input-selectSelecione o tipo de teleconsultoria"]//span[@class='dropdown-btn']
${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.sim.tipo.sincrona}         xpath://li[.//div[text()='Síncrona']]
${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.sim.tipo.assincrona}       xpath://li[.//div[text()='Assíncrona']]

${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente}                                  xpath://*[@id="availableToThePatient"]/label[2]
${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao}                 xpath:(//*[@id="input-select "]//span[@class='dropdown-btn'])[1]
${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao.agora}           xpath:(//li[.//div[text()='Agora']])[1]
${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores}                                xpath://*[@id="availableToTheOperator"]/label[2]

${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao}               xpath:(//*[@id="input-select "]//span[@class='dropdown-btn'])[2]
${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao.agora}         xpath:(//li[.//div[text()='Agora']])[2]
${tela_publicar_agenda.publicacao_agenda.botao_publicar_agenda}                                     xpath://button[text()=" Publicar agenda"]
${tela_confirmar_agenda.botao_confirmar}                                                            xpath://button[text()="Confirmar"]

### Variáveis que estão na tela de agendamento de paciente
${jornada_do_paciente.lista_pacientes.paciente_selecionado.agendar}                                 xpath://button//i[@class='fa fa-calendar-alt']
${agenda.configuracao_agendamento.selecione_o_dia.data}                                             xpath://span[contains(@class, 'flatpickr-day') and @aria-current="date"]
${agenda.configuracao_agendamento.nome_do_profissional}                                             xpath://*[@id="input-selectNome do profissional (Obrigatório)"]//span[@class='dropdown-btn']
${nome_do_profissional.medico_requisitado}                                                          xpath:(//li[.//div[text()="PROFISSIONAL REQUISITADO"]])[2]
${agenda.configuracao_agendamento.horario_disponivel}                                               xpath:(//span[contains(@class, 'btn-green')])[1]
${agenda.configuracao_agendamento.botao_confirmar_agendamento}                                      xpath://button[contains(text(), 'Confirmar agendamento')]

### Variáveis que estão na tela de listagem de pacientes agendados
${sala_de_atendimento.agendamento.selecione_o_dia}                                                  xpath:(//input[@type="text" and @placeholder="Selecione o dia"])[2]
${sala_de_atendimento.agendamento.selecione_o_dia.data}                                             xpath:(//span[contains(@class, 'flatpickr-day') and @aria-current="date"])[2]
${sala_de_atendimento.agendamento.nome_do_profissional}                                             xpath://*[@id="input-selectNome do profissional (Obrigatório)"]//span[@class='dropdown-btn']

${sala_de_atendimento.agendamento.paciente_agendado.botao_remover}                                  xpath://i[contains(@class, 'mdi-delete')][1]    ### //tbody/tr[.//i[contains(@class, 'mdi-delete')]][1]//i[contains(@class, 'mdi-delete')]
${sala_de_atendimento.agendamento.paciente_agendado.botao_prontuario}                               xpath://i[contains(@class, 'mdi mdi-account-card-details')][1]
${tela_excluir_consulta.paciente_sem_conexao}                                                       xpath://div[@class='swal2-radio d-block text-left']/label[4]
${tela_excluir_consulta.botao_ok}                                                                   xpath://button[contains(text(), 'OK')]

### Variáveis que estão na tela de consultar unidades de atendimento
${tela_consultas_agendadas.unidade_de_atendimento}                                                  xpath://*[@id="input-selectSelecione a unidade de atendimento*"]//span[@class='dropdown-btn']
${tela_consultas_agendadas.unidade_de_atendimento.smart}                                            xpath://*[@id="input-selectSelecione a unidade de atendimento*"]//li[.//div[text()='TELESSAÚDE SUS']]
${tela_consultas_agendadas.especialidade}                                                           xpath://*[@id="input-selectEspecialidade*"]//span[@class='dropdown-btn']
${tela_consultas_agendadas.especialidade.ginecologia_e_obstetricia}                                 xpath://*[@id="input-selectEspecialidade*"]//li[.//div[text()='GINECOLOGIA E OBSTETRÍCIA']]
${tela_consultas_agendadas.nome_do_profissional}                                                    xpath://*[@id="input-selectNome do profissional (Opcional)"]//span[@class='dropdown-btn']
${tela_consultas_agendadas.nome_do_profissional.medico_masculino}                                   xpath://*[@id="input-selectNome do profissional (Opcional)"]//li[.//div[text()='PROFISSIONAL REQUISITADO']]
${tela_consultas_agendadas.a_partir_da_data}                                                        xpath:(//input[@type="text" and @placeholder="Selecione o dia"])[1]
${tela_consultas_agendadas.a_partir_da_data.dia}                                                    xpath:(//span[contains(@class, 'flatpickr-day') and @aria-current="date"])[1]
${tela_consultas_agendadas.filtro}                                                                  xpath://span[contains(text(), 'Filtro') and contains(@class, 'texto-indicativo')]
${tela_consultas_agendadas.filtro.ambos}                                                            xpath://label[input[@type='radio' and @value='appointment'] and contains(., 'Consulta')]
${tela_consultas_agendadas.filtro.buscar}                                                           xpath://button[contains(text(), 'Buscar')]
${tela_consultas_agendadas.lista_agendamentos}                                                      xpath://div[contains(@class, 'day-card')]
${tela_consultas_agendadas.lista_agendamentos.consulta_agendada_disponivel}                         xpath:(//div[contains(@class, 'div-green')])[1]
${tela_consultas_agendadas.lista_agendamentos.consulta_agendada_disponivel.cancelar_consulta}       xpath:(//div[contains(@class, 'div-green')])[1]//button[contains(., 'Cancelar consulta')]
${tela_consultas_agendadas.lista_agendamentos.consulta_agendada_disponivel.ir_para_prontuario}      xpath:(//div[contains(@class, 'div-green')])[1]//button[contains(., 'Ir para o Prontuário')]

*** Keywords ***
Carregar modelo de agenda
    [Arguments]    ${modelo_agenda}
    Wait Until Element Is Visible    ${tela_publicar_agenda.carregar_modelo}    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.carregar_modelo}

    Wait Until Element Is Visible    ${modelo_agenda}
    Scroll Element Into View    ${modelo_agenda}
    Click Element    ${modelo_agenda}

    Wait Until Element Is Visible    ${tela_publicar_agenda.carregar_modelo.fechar}
    Click Element    ${tela_publicar_agenda.carregar_modelo.fechar}

Preencher agenda com modelo
    ### Selecionar linha de cuidado ### Abordagem para dropdowns select
    Scroll Element Into View    ${tela_publicar_agenda.linha_de_cuidado}
    Wait Until Element Is Visible    ${tela_publicar_agenda.linha_de_cuidado}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    
    ### Is Multiselect Empty é uma Keyword Personalizada
    ${linha_de_cuidado}=    Is Multiselect Empty
    ...    ${tela_publicar_agenda.linha_de_cuidado}
    IF    ${linha_de_cuidado}
        Log    Dropdown vazio, executa as ações abaixo.
        Click Element    ${tela_publicar_agenda.linha_de_cuidado.saude_do_idoso}
        Scroll Element Into View    ${tela_publicar_agenda.linha_de_cuidado.saude_do_idoso}
        Wait Until Element Is Visible    ${tela_publicar_agenda.linha_de_cuidado.saude_do_idoso}
        Click Element    ${tela_publicar_agenda.linha_de_cuidado.saude_do_idoso}
    ELSE
        Log    Dropdown já preenchido - Nenhuma ação necessária.    INFO
    END

    ### Selecionar atendimento
    Scroll Element Into View    ${tela_publicar_agenda.tipo_de_atendimento}
    Wait Until Element Is Visible    ${tela_publicar_agenda.tipo_de_atendimento}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    ${tipo_de_atendimento}=    Is Multiselect Empty    ${tela_publicar_agenda.tipo_de_atendimento}
    IF    ${tipo_de_atendimento}
        Log    Dropdown vazio, executa as ações abaixo.
        Click Element    ${tela_publicar_agenda.tipo_de_atendimento}
        Scroll Element Into View    ${tela_publicar_agenda.tipo_de_atendimento.atendimentos_por_chat}
        Wait Until Element Is Visible    ${tela_publicar_agenda.tipo_de_atendimento.atendimentos_por_chat}
        Click Element    ${tela_publicar_agenda.tipo_de_atendimento.atendimentos_por_chat}
    ELSE
        Log    Dropdown já preenchido - Nenhuma ação necessária.    INFO
    END

    ### Selecionar procedimento
    Scroll Element Into View    ${tela_publicar_agenda.procedimento}
    Wait Until Element Is Visible    ${tela_publicar_agenda.procedimento}    ${tempo_padrao}
    ${qual_procedimento}=    Is Multiselect Empty    ${tela_publicar_agenda.procedimento}
    IF    ${qual_procedimento}
        Log    Dropdown vazio, executa as ações abaixo.
        Click Element    ${tela_publicar_agenda.procedimento}
        Scroll Element Into View    ${tela_publicar_agenda.procedimento.laboratorial}
        Wait Until Element Is Visible    ${tela_publicar_agenda.procedimento.laboratorial}
        Click Element    ${tela_publicar_agenda.procedimento.laboratorial}
    ELSE
        Log    Dropdown já preenchido - Nenhuma ação necessária.    INFO
    END

    ### Selecionar hora início
    Scroll Element Into View    ${tela_publicar_agenda.data_e_hora.inicio}
    Wait Until Element Is Visible    ${tela_publicar_agenda.data_e_hora.inicio}    ${tempo_padrao}
    ${horario_atual}=    Is Multiselect Empty    ${tela_publicar_agenda.data_e_hora.inicio}
    IF    ${horario_atual}
        Log    Dropdown vazio, executa as ações abaixo.
        Click Element    ${tela_publicar_agenda.data_e_hora.inicio}
        Scroll Element Into View    ${tela_publicar_agenda.data_e_hora.inicio.hora.7:00}
        Wait Until Element Is Visible    ${tela_publicar_agenda.data_e_hora.inicio.hora.7:00}
        Click Element    ${tela_publicar_agenda.data_e_hora.inicio.hora.7:00}
    ELSE
        Log    Dropdown já preenchido - Nenhuma ação necessária.    INFO
    END

    ### Selecionar quantidade de pacientes
    Scroll Element Into View    ${tela_publicar_agenda.data_e_hora.quantidade_de_pacientes}
    Wait Until Element Is Visible    ${tela_publicar_agenda.data_e_hora.quantidade_de_pacientes}    ${tempo_padrao}
    ${quantidade_paciente}=    Set Variable    ${tela_publicar_agenda.data_e_hora.quantidade_de_pacientes}

    ### Is Input Empty é uma Keyword Personalizada
    ${empty}=    Is Input Empty    ${quantidade_paciente}
    IF    ${empty}
        Log    Campo de quantidade de pacientes está vazio, preenchendo com valor.
        Input Text    ${quantidade_paciente}    5
    ELSE
        Log    Campo já preenchido - nenhuma ação necessária.    INFO
    END

    ### Selecionar hora fim
    Scroll Element Into View    ${tela_publicar_agenda.data_e_hora.fim}
    Wait Until Element Is Visible    ${tela_publicar_agenda.data_e_hora.fim}    ${tempo_padrao}
    ${horario_atual}=    Is Multiselect Empty    ${tela_publicar_agenda.data_e_hora.fim}
    IF    ${horario_atual}
        Log    Dropdown vazio, executa as ações abaixo.
        Click Element    ${tela_publicar_agenda.data_e_hora.fim}
        Scroll Element Into View    ${tela_publicar_agenda.data_e_hora.fim.hora.8:40}
        Wait Until Element Is Visible    ${tela_publicar_agenda.data_e_hora.fim.hora.8:40}
        Click Element    ${tela_publicar_agenda.data_e_hora.fim.hora.8:40}
    ELSE
        Log    Dropdown já preenchido - Nenhuma ação necessária.    INFO
    END

    ### Data inicio
    Scroll Element Into View    ${sala_de_atendimento.agendamento.selecione_o_dia}
    Wait Until Element Is Visible    ${sala_de_atendimento.agendamento.selecione_o_dia}    ${tempo_padrao}
    Click Element    ${sala_de_atendimento.agendamento.selecione_o_dia}
    Wait Until Element Is Visible    ${sala_de_atendimento.agendamento.selecione_o_dia.data}    ${tempo_padrao}
    Click Element    ${sala_de_atendimento.agendamento.selecione_o_dia.data}

    ### Data fim recorrência
    Scroll Element Into View    ${tela_publicar_agenda.data_e_hora.recorrente_ate}
    Wait Until Element Is Visible    ${tela_publicar_agenda.data_e_hora.recorrente_ate}    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.data_e_hora.recorrente_ate}
    ${dia_futuro}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=7)).day
    Click Element    (//span[contains(@class, 'flatpickr-day') and text()='${dia_futuro}'])[2]
    Sleep    ${tempo_minimo}

    ### Disponibilizar para unidades [não]
    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_unidades.nao}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_unidades.nao}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_unidades.nao}

    ### Disponibilizar para teleconsultoria [não]
    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.nao}
    Wait Until Element Is Visible    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.nao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.nao}

    ### Disponibilizar para pacientes [sim][agora]
    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente}
    Scroll Element Into View
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao}
    Scroll Element Into View
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao.agora}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao.agora}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao.agora}

    ### Disponibilizar para pacientes [sim][agora]
    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores}
    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao}
    Scroll Element Into View
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao.agora}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao.agora}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao.agora}

Acessar gestão de agenda
    Wait Until Element Is Visible    ${menu.gestao_de_agenda}    ${tempo_padrao}
    Mouse Over    ${menu.gestao_de_agenda}

Selecionar configuração de agenda
    Wait Until Element Is Visible    ${menu.gestao_de_agenda.configuracao_de_agenda}    ${tempo_padrao}
    Click Element    ${menu.gestao_de_agenda.configuracao_de_agenda}
    Sleep    ${tempo_minimo}
    Mouse Over    ${div_header}

Verificar página de configuração de agenda
    Wait Until Element Is Visible    ${gestao_de_agenda.configuracao_de_agenda.titulo}    ${tempo_padrao}
    Sleep    ${tempo_minimo}

Filtrar configuração de agenda
    [Arguments]    ${nome_do_profissional}
    Wait Until Element Is Visible    ${configuracao_de_agenda.unidade_de_atendimento}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Element    ${configuracao_de_agenda.unidade_de_atendimento}
    Scroll Element Into View    ${configuracao_de_agenda.unidade_de_atendimento.smart}
    Wait Until Element Is Visible    ${configuracao_de_agenda.unidade_de_atendimento.smart}    ${tempo_padrao}
    Click Element    ${configuracao_de_agenda.unidade_de_atendimento.smart}
    Sleep    ${tempo_minimo}

    Click Element    ${configuracao_de_agenda.profissao}
    Scroll Element Into View    ${configuracao_de_agenda.profissao.medico}
    Wait Until Element Is Visible    ${configuracao_de_agenda.profissao.medico}    ${tempo_padrao}
    Click Element    ${configuracao_de_agenda.profissao.medico}
    Sleep    ${tempo_minimo}

    Click Element    ${configuracao_de_agenda.especialidade}
    Scroll Element Into View    ${configuracao_de_agenda.especialidade.ginecologia_e_obstetricia}
    Wait Until Element Is Visible
    ...    ${configuracao_de_agenda.especialidade.ginecologia_e_obstetricia}
    ...    ${tempo_padrao}
    Click Element    ${configuracao_de_agenda.especialidade.ginecologia_e_obstetricia}

    Click Element    ${configuracao_de_agenda.nome_do_profissional}
    Scroll Element Into View    ${nome_do_profissional}
    Wait Until Element Is Visible    ${nome_do_profissional}    ${tempo_padrao}
    Click Element    ${nome_do_profissional}

Clicar no botão filtrar agenda
    Wait Until Element Is Visible    ${configuracao_de_agenda.filtrar_profissional}    ${tempo_padrao}
    Click Element    ${configuracao_de_agenda.filtrar_profissional}
    Sleep    ${tempo_minimo}

Clicar no botão configurar/publicar agenda
    Scroll To Top
    Mouse Over    //header
    Wait Until Element Is Visible    ${configuracao_de_agenda.botao_configurar_publica_agenda}    ${tempo_padrao}
    Set Focus To Element    ${configuracao_de_agenda.botao_configurar_publica_agenda}
    Click Button    ${configuracao_de_agenda.botao_configurar_publica_agenda}

Selecionar agenda definida
    Wait Until Element Is Visible    ${tela_publicar_agenda}    ${tempo_padrao}
    Wait Until Element Is Visible    ${tela_publicar_agenda.escala_vinculada.smart.botao_selecionar}    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.escala_vinculada.smart.botao_selecionar}

Preencher configuração de agenda
    Scroll Element Into View    ${tela_publicar_agenda.linha_de_cuidado}
    Wait Until Element Is Visible    ${tela_publicar_agenda.linha_de_cuidado}    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.linha_de_cuidado}
    Scroll Element Into View    ${tela_publicar_agenda.linha_de_cuidado.saude_do_idoso}
    Wait Until Element Is Visible    ${tela_publicar_agenda.linha_de_cuidado.saude_do_idoso}    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.linha_de_cuidado.saude_do_idoso}

    Click Element    ${tela_publicar_agenda.tipo_de_atendimento}
    Scroll Element Into View    ${tela_publicar_agenda.tipo_de_atendimento.atendimentos_por_chat}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.tipo_de_atendimento.atendimentos_por_chat}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.tipo_de_atendimento.atendimentos_por_chat}

    Scroll Element Into View    ${tela_publicar_agenda.procedimento}
    Wait Until Element Is Visible    ${tela_publicar_agenda.procedimento}    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.procedimento}
    Scroll Element Into View    ${tela_publicar_agenda.procedimento.laboratorial}
    Wait Until Element Is Visible    ${tela_publicar_agenda.procedimento.laboratorial}    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.procedimento.laboratorial}
    Scroll Element Into View    ${tela_publicar_agenda.data_e_hora.quantidade_de_pacientes}

    Scroll Element Into View    ${tela_publicar_agenda.data_e_hora.inicio}
    Wait Until Element Is Visible    ${tela_publicar_agenda.data_e_hora.inicio}    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.data_e_hora.inicio}
    Scroll Element Into View    ${tela_publicar_agenda.data_e_hora.inicio.hora.14:30}
    Wait Until Element Is Visible    ${tela_publicar_agenda.data_e_hora.inicio.hora.14:30}    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.data_e_hora.inicio.hora.14:30}

    Scroll Element Into View    ${tela_publicar_agenda.data_e_hora.quantidade_de_pacientes}
    Wait Until Element Is Visible    ${tela_publicar_agenda.data_e_hora.quantidade_de_pacientes}    ${tempo_padrao}
    Input Text    ${tela_publicar_agenda.data_e_hora.quantidade_de_pacientes}    ${dias}

    Scroll Element Into View    ${tela_publicar_agenda.data_e_hora.disponibilidade_recorrente}
    Wait Until Element Is Visible    ${tela_publicar_agenda.data_e_hora.disponibilidade_recorrente}    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.data_e_hora.disponibilidade_recorrente}

    Scroll Element Into View    ${sala_de_atendimento.agendamento.selecione_o_dia}
    Wait Until Element Is Visible    ${sala_de_atendimento.agendamento.selecione_o_dia}    ${tempo_padrao}
    Click Element    ${sala_de_atendimento.agendamento.selecione_o_dia}
    Wait Until Element Is Visible    ${tela_pubicar_agenda.data_e_hora.selecione_o_dia.data}    ${tempo_padrao}
    Click Element    ${tela_pubicar_agenda.data_e_hora.selecione_o_dia.data}

    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_unidades.nao}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_unidades.nao}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_unidades.nao}

    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.nao}
    Wait Until Element Is Visible    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.nao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.nao}

    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.nao}
    Wait Until Element Is Visible    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.nao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_teleconsultoria.nao}

    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente}

    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores}
    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao}

    Scroll Element Into View
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao.agora}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao.agora}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_paciente.tempo_publicacao.agora}

    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao}
    Scroll Element Into View
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao.agora}
    Wait Until Element Is Visible
    ...    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao.agora}
    ...    ${tempo_padrao}
    Click Element    ${tela_publicar_agenda.publicacao_agenda.disponivel_para_operadores.tempo_publicacao.agora}

Clicar no botão publicar agenda
    Scroll Element Into View    ${tela_publicar_agenda.publicacao_agenda.botao_publicar_agenda}
    Wait Until Element Is Visible    ${tela_publicar_agenda.publicacao_agenda.botao_publicar_agenda}    ${tempo_padrao}
    Click Button    ${tela_publicar_agenda.publicacao_agenda.botao_publicar_agenda}
    Sleep    ${tempo_minimo}

Confirmar publicação de agenda
    Scroll Element Into View    ${tela_confirmar_agenda.botao_confirmar}
    Wait Until Element Is Visible    ${tela_confirmar_agenda.botao_confirmar}    ${tempo_padrao}
    Click Button    ${tela_confirmar_agenda.botao_confirmar}
    Scroll To Top

Selecionar agendamento do paciente
    Scroll Element Into View    ${jornada_do_paciente.lista_pacientes.paciente_selecionado.agendar}
    Wait Until Element Is Visible
    ...    ${jornada_do_paciente.lista_pacientes.paciente_selecionado.agendar}
    ...    ${tempo_padrao}
    Click Element    ${jornada_do_paciente.lista_pacientes.paciente_selecionado.agendar}

Selecionar data agendamento
    Scroll Element Into View    ${agenda.configuracao_agendamento.selecione_o_dia.data}
    Wait Until Element Is Visible    ${agenda.configuracao_agendamento.selecione_o_dia.data}    ${tempo_padrao}
    Click Element    ${agenda.configuracao_agendamento.selecione_o_dia.data}

Selecionar profissinal para agendamento
    [Arguments]    ${nome_do_profissional}
    Scroll Element Into View    ${agenda.configuracao_agendamento.nome_do_profissional}
    Wait Until Element Is Visible    ${agenda.configuracao_agendamento.nome_do_profissional}    ${tempo_padrao}
    Click Element    ${agenda.configuracao_agendamento.nome_do_profissional}
    Scroll Element Into View    ${nome_do_profissional}
    Wait Until Element Is Visible
    ...    ${nome_do_profissional}
    ...    ${tempo_padrao}
    Click Element    ${nome_do_profissional}

Selecionar horário disponível para agendamento
    Wait Until Element Is Visible    ${agenda.configuracao_agendamento.horario_disponivel}    ${tempo_padrao}
    Click Element    ${agenda.configuracao_agendamento.horario_disponivel}
    Sleep    ${tempo_minimo}

Finalizar agendamento
    Scroll Element Into View    ${agenda.configuracao_agendamento.botao_confirmar_agendamento}
    Wait Until Element Is Enabled    ${agenda.configuracao_agendamento.botao_confirmar_agendamento}    ${tempo_padrao}
    Click Element    ${agenda.configuracao_agendamento.botao_confirmar_agendamento}
    Scroll To Top
    Sleep    ${tempo_elemento}

Excluir paciente agendado
    Scroll Element Into View    ${sala_de_atendimento.agendamento.paciente_agendado.botao_remover}
    Wait Until Element Is Visible
    ...    ${sala_de_atendimento.agendamento.paciente_agendado.botao_remover}
    ...    ${tempo_padrao}
    Click Element    ${sala_de_atendimento.agendamento.paciente_agendado.botao_remover}

Confirmar exclusão de paciente agendado
    Wait Until Element Is Visible    ${tela_excluir_consulta.paciente_sem_conexao}    ${tempo_padrao}
    Click Element    ${tela_excluir_consulta.paciente_sem_conexao}
    Wait Until Element Is Enabled    ${tela_excluir_consulta.botao_ok}    ${tempo_padrao}
    Click Element    ${tela_excluir_consulta.botao_ok}

Clicar no botão consultar unidades de atendimento
    Wait Until Element Is Visible
    ...    ${configuracao_de_agenda.botao_consutar_unidades_de_atendimento}
    ...    ${tempo_padrao}

Filtrar unidades de atendimento
    Wait Until Element Is Visible
    ...    ${configuracao_de_agenda.botao_consutar_unidades_de_atendimento}
    ...    ${tempo_padrao}
    Click Button    ${configuracao_de_agenda.botao_consutar_unidades_de_atendimento}
    Sleep    ${tempo_minimo}
    Wait Until Element Is Visible    ${tela_consultas_agendadas.unidade_de_atendimento}    ${tempo_padrao}
    Click Element    ${tela_consultas_agendadas.unidade_de_atendimento}
    Scroll Element Into View    ${tela_consultas_agendadas.unidade_de_atendimento.smart}
    Wait Until Element Is Visible    ${tela_consultas_agendadas.unidade_de_atendimento.smart}    ${tempo_padrao}
    Click Element    ${tela_consultas_agendadas.unidade_de_atendimento.smart}
    Sleep    ${tempo_minimo}

    Wait Until Element Is Visible    ${tela_consultas_agendadas.especialidade}    ${tempo_padrao}
    Click Element    ${tela_consultas_agendadas.especialidade}
    Scroll Element Into View    ${tela_consultas_agendadas.especialidade.ginecologia_e_obstetricia}
    Wait Until Element Is Visible
    ...    ${tela_consultas_agendadas.especialidade.ginecologia_e_obstetricia}
    ...    ${tempo_padrao}
    Click Element    ${tela_consultas_agendadas.especialidade.ginecologia_e_obstetricia}
    Sleep    ${tempo_minimo}

    Wait Until Element Is Visible    ${tela_consultas_agendadas.nome_do_profissional}    ${tempo_padrao}
    Click Element    ${tela_consultas_agendadas.nome_do_profissional}
    Scroll Element Into View    ${tela_consultas_agendadas.nome_do_profissional.medico_masculino}
    Wait Until Element Is Visible
    ...    ${tela_consultas_agendadas.nome_do_profissional.medico_masculino}
    ...    ${tempo_padrao}
    Click Element    ${tela_consultas_agendadas.nome_do_profissional.medico_masculino}
    Sleep    ${tempo_minimo}

    Scroll Element Into View    ${tela_consultas_agendadas.a_partir_da_data}
    Wait Until Element Is Visible    ${tela_consultas_agendadas.a_partir_da_data}    ${tempo_padrao}
    Click Element    ${tela_consultas_agendadas.a_partir_da_data}
    Wait Until Element Is Visible    ${tela_consultas_agendadas.a_partir_da_data.dia}    ${tempo_padrao}
    Click Element    ${tela_consultas_agendadas.a_partir_da_data.dia}

    Scroll Element Into View    ${tela_consultas_agendadas.filtro}
    Wait Until Element Is Visible    ${tela_consultas_agendadas.filtro}    ${tempo_padrao}
    Click Element    ${tela_consultas_agendadas.filtro}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${tela_consultas_agendadas.filtro.ambos}
    Wait Until Element Is Visible    ${tela_consultas_agendadas.filtro.ambos}    ${tempo_padrao}
    Click Element    ${tela_consultas_agendadas.filtro.ambos}
    Sleep    ${tempo_minimo}

    Scroll Element Into View    ${tela_consultas_agendadas.filtro.buscar}
    Wait Until Element Is Enabled    ${tela_consultas_agendadas.filtro.buscar}    ${tempo_padrao}
    Click Element    ${tela_consultas_agendadas.filtro.buscar}
    Sleep    ${tempo_minimo}

Selecionar paciente e excluir consulta agendada
    Scroll Element Into View    ${tela_consultas_agendadas.lista_agendamentos}
    Wait Until Element Is Visible    ${tela_consultas_agendadas.lista_agendamentos}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Element    ${tela_consultas_agendadas.lista_agendamentos.consulta_agendada_disponivel}

    Sleep    ${tempo_minimo}
    Click Button    ${tela_consultas_agendadas.lista_agendamentos.consulta_agendada_disponivel.cancelar_consulta}

Selecionar paciente e acessar fichas de prontuário
    Scroll Element Into View    ${tela_consultas_agendadas.lista_agendamentos}
    Wait Until Element Is Visible    ${tela_consultas_agendadas.lista_agendamentos}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Element    ${tela_consultas_agendadas.lista_agendamentos.consulta_agendada_disponivel}

    Sleep    ${tempo_minimo}
    Click Button    ${tela_consultas_agendadas.lista_agendamentos.consulta_agendada_disponivel.ir_para_prontuario}

Acessar prontuário de paciente agendado
    Scroll Element Into View    ${sala_de_atendimento.agendamento.paciente_agendado.botao_prontuario}
    Wait Until Element Is Visible
    ...    ${sala_de_atendimento.agendamento.paciente_agendado.botao_prontuario}
    ...    ${tempo_padrao}
    Click Element    ${sala_de_atendimento.agendamento.paciente_agendado.botao_prontuario}
