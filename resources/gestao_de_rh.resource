*** Settings ***
Documentation       Este arquivo contém tudo relacionado aos processos da aba e telas de jornada do paciente.

Library             SeleniumLibrary
Resource            navegador.resource
Resource            dados_comuns.resource
Resource            dashboard.resource


*** Variables ***
### Variáveis que estão na tela de gestão de rh
${menu.gestao_de_rh}                                                            xpath://a[contains(., 'Gestão de RH')]
${menu.gestao_de_rh.gestao_de_usuarios}                                         xpath://span[@class='hide-menu' and text()='Gestão de usuários']

### Variáveis que estão na tela de gestão de usuário em gestão de rh
${menu.gestao_de_rh.gestao_de_usuarios.adicionar}                               xpath://button[contains(text(),"Adicionar")]
${gestao_de_rh.pesquisar.titulo}                                                xpath://h4[contains(@class,"page-title") and contains(text(),"Gestão de usuários")]
${gestao_de_rh.cadastro_de_usuario.titulo}                                      xpath://h4[contains(@class,"page-title") and contains(text(),"Cadastro de usuário")]
${gestao_de_rh.cadastro_de_usuario.novo_cadastro}                               xpath://button[contains(text(),"Novo cadastro")]
${gestao_de_rh.cadastro_de_usuario.tornar_paciente}                             xpath://button[contains(text(),"Tornar Paciente")]
${gestao_de_rh.pesquisar}                                                       xpath://input[@type='search' and @placeholder='Pesquisar...']
${gestao_de_rh.botao_pesquisar}                                                 xpath://button[text()='Pesquisar']
${gestao_de_rh.profissional_encontrado}                                         xpath:(//tbody[@class='thead-light']/tr)[1]
${gestao_de_rh.profissional_encontrado.visualizar}                              xpath://i[@class='fa fa-eye' and @ngbtooltip='Visualizar']
${gestao_de_rh.profissional_encontrado.editar}                                  xpath://i[@class='fa fa-edit' and @ngbtooltip='Editar']
${gestao_de_rh.usuario_encontrado}                                              xpath://tr[td[1][contains(normalize-space(.), 'PROFISSIONAL')] and td[3][normalize-space(.)='profissional']][1]
${gestao_de_rh.usuario_encontrado.cpf}                                          xpath://tr[td[1][contains(normalize-space(.), 'PROFISSIONAL')] and td[3][normalize-space(.)='profissional']][1]/td[2]/span
${gestao_de_rh.usuario_encontrado.editar}                                       xpath://tr[td[1][contains(normalize-space(.), 'PROFISSIONAL')] and td[3][normalize-space(.)='profissional']][1]//button[i[@ngbtooltip='Editar']]

### Variáveis que estão na tela de edição de usuário em gestão de rh
${gestao_de_rh.edicao_de_usuario.perfil}                                        xpath://*[@id="input-selectPerfil"]//span[@class="dropdown-btn"]
${gestao_de_rh.edicao_de_usuario.perfil.profissional}                           xpath://*[@id="input-selectPerfil"]//li[.//div[text()="profissional"]]
${gestao_de_rh.edicao_de_usuario.agendamento_profissoes}                        xpath://*[@id="input-selectEste usuário pode fazer agendamento para as profissões:"]//span[@class="dropdown-btn"]
${gestao_de_rh.edicao_de_usuario.agendamento_profissoes.medico}                 xpath://*[@id="input-selectEste usuário pode fazer agendamento para as profissões:"]//li[.//div[text()="MÉDICO"]]
${gestao_de_rh.edicao_de_usuario.agendamento_especialidades}                    xpath://*[@id="input-selectEste usuário pode fazer agendamento para as especialidades:"]//span[@class="dropdown-btn"]
${gestao_de_rh.edicao_de_usuario.agendamento_especialidades.clinico}            xpath://*[@id="input-selectEste usuário pode fazer agendamento para as especialidades:"]//li[.//div[text()="CLÍNICO"]]
${gestao_de_rh.edicao_de_usuario.informacao.origem_profissional}                xpath://*[@id="input-selectOrigem do profissional"]//span[@class="dropdown-btn"]
${gestao_de_rh.edicao_de_usuario.informacao.tipo_de_vinculo}                    xpath://*[@id="input-selectTipo de vínculo"]//span[@class="dropdown-btn"]
${gestao_de_rh.edicao_de_usuario.informacao.tipo_de_vinculo.contratado_clt}     xpath://*[@id="input-selectTipo de vínculo"]//li[.//div[text()="Contratado CLT"]]
${gestao_de_rh.edicao_de_usuario.informacao.profissao}                          xpath://*[@id="input-selectProfissão"]//span[@class="dropdown-btn"]
${gestao_de_rh.edicao_de_usuario.informacao.profissao.medico}                   xpath://*[@id="input-selectProfissão"]//li[.//div[text()="MÉDICO"]]
${gestao_de_rh.edicao_de_usuario.informacao.especialidade}                      xpath://*[@id="input-selectEspecialidades"]//span[@class="dropdown-btn"]
${gestao_de_rh.edicao_de_usuario.informacao.especialidade.clinico}              xpath://*[@id="input-selectEspecialidades"]//li[.//div[text()="CLÍNICO"]]
${gestao_de_rh.edicao_de_usuario.adicionar_unidade_de_atendimento}              xpath://button[contains(., 'Adicionar unidade de atendimento')]
${gestao_de_rh.edicao_de_usuario.unidade_de_atendimento}                        xpath://*[@id="input-selectUnidade de atendimento"]//span[@class="dropdown-btn"]
${gestao_de_rh.edicao_de_usuario.unidade_de_atendimento.sasbrasil}              xpath://*[@id="input-selectUnidade de atendimento"]//li[.//div[text()="SASBRASIL"]]
${gestao_de_rh.edicao_de_usuario.tipo_de_escala}                                xpath://*[@id="input-selectTipo de escala"]//span[@class="dropdown-btn"]
${gestao_de_rh.edicao_de_usuario.tipo_de_escala.administrador_sas}              xpath://*[@id="input-selectTipo de escala"]//li[.//div[text()="ADMINISTRADOR SAS"]]
${gestao_de_rh.edicao_de_usuario.data_de_vinculo}                               xpath:(//input[@type="text" and @placeholder="Selecione o dia"])[1]
${gestao_de_rh.edicao_de_usuario.data_de_vinculo.dia}                           xpath:(//span[contains(@class, 'flatpickr-day') and @aria-current="date"])[1]
${gestao_de_rh.edicao_de_usuario.ativo_no_sistema}                              xpath://*[@for="input-checkbox-active"]
${gestao_de_rh.edicao_de_usuario.calcular_carga_horaria}                        xpath://button[contains(., 'Calcular carga horária')]
${gestao_de_rh.edicao_de_usuario.salvar}                                        xpath://button[contains(., 'Salvar')]
${gestao_de_rh.edicao_de_usuario.voltar}                                        xpath://button[contains(., 'Voltar')]
${gestao_de_rh.edicao_de_usuario.ativar_validacao_de_duas_etapas}               xpath://button[contains(., 'Ativar validação de duas etapas')]

${ficha_saude_geral.interconsulta.area}                                         xpath://*[@id="input-selectÁrea"]//span[@class="dropdown-btn"]
${ficha_saude_geral.interconsulta.area.medico}                                  xpath://*[@id="input-selectÁrea"]//li[.//div[text()="MÉDICO"]]
${ficha_saude_geral.interconsulta.especialidade}                                xpath://*[@id="input-selectEspecialidade"]//span[@class="dropdown-btn"]
${ficha_saude_geral.interconsulta.especialidade.cirurgiao_geral}                xpath://*[@id="input-selectEspecialidade"]//li[.//div[contains(text(),"GENERALISTA")]]

### Variáveis que estão na tela de cadastrar paciente em gestão de rh
${gestao_de_rh.cadastrar_usuario.dados_pessoais.nome}                           xpath://input[@id='input-text-Nome']
${gestao_de_rh.cadastrar_usuario.dados_pessoais.sobrenome}                      xpath://input[@id="input-text-Sobrenome"]
${gestao_de_rh.cadastrar_usuario.dados_pessoais.data_de_nascimento}             xpath://input[@id="input-text-Data de nascimento (00/00/0000)"]
${gestao_de_rh.cadastrar_usuario.dados_pessoais.cpf}                            xpath://input[@id="input-text-CPF*"]
${gestao_de_rh.cadastrar_usuario.dados_pessoais.cns}                            xpath://input[@id="input-text-CNS"]
${gestao_de_rh.cadastrar_usuario.dados_pessoais.nome_social}                    xpath://input[@id="input-text-Nome social"]

${gestao_de_rh.cadastrar_usuario.dados_pessoais.genero}                         xpath://*[@id="input-selectGênero"]//span[@class="dropdown-btn"]
${gestao_de_rh.cadastrar_usuario.dados_pessoais.genero.cisgenero}               xpath://*[@id="input-selectGênero"]//li[.//div[text()="Cisgênero"]]
${gestao_de_rh.cadastrar_usuario.dados_pessoais.sexo}                           xpath://*[@id="input-selectSexo"]//span[@class="dropdown-btn"]
${gestao_de_rh.cadastrar_usuario.dados_pessoais.sexo.masculino}                 xpath://*[@id="input-selectSexo"]//li[.//div[text()="Masculino"]]
${gestao_de_rh.cadastrar_usuario.dados_pessoais.raca}                           xpath://*[@id="input-selectRaça/cor"]//span[@class="dropdown-btn"]
${gestao_de_rh.cadastrar_usuario.dados_pessoais.raca.preta}                     xpath://*[@id="input-selectRaça/cor"]//li[.//div[text()="Preta"]]
${gestao_de_rh.cadastrar_usuario.dados_pessoais.etnia}                          xpath://input[@id="input-text-Etnia"]
${gestao_de_rh.cadastrar_usuario.dados_pessoais.nome_da_mae}                    xpath://input[@id="input-text-Nome da mãe"]

# ${gestao_de_rh.cadastrar_usuario.telefones.etiqueta}                            xpath://span[contains(@class, 'dropdown-btn')][1]
# ${gestao_de_rh.cadastrar_usuario.telefones.etiqueta.contato}                    xpath://li[contains(@class, 'multiselect-item-checkbox')]
${gestao_de_rh.cadastrar_usuario.telefones.ddd}                                 xpath://input[@id="input-text-DDD**"]
${gestao_de_rh.cadastrar_usuario.telefones.numero}                              xpath://input[@id="input-text-Celular** (**obrigatório p/ pacientes sem e-mail)"]
${gestao_de_rh.cadastrar_usuario.dados_pessoais.email}                          xpath://input[@id="input-text-E-mail* (*obrigatório para médicos)"]

${gestao_de_rh.cadastrar_usuario.origem_profissional}                           xpath://*[@id="input-selectOrigem do profissional"]//span[@class="dropdown-btn"]
${gestao_de_rh.cadastrar_usuario.origem_profissional.sas_brasil}                xpath://*[@id="input-selectOrigem do profissional"]//li[.//div[text()="SAS brasil"]]
${gestao_de_rh.cadastrar_usuario.profissao}                                     xpath://*[@id="input-selectProfissão"]//span[@class="dropdown-btn"]
${gestao_de_rh.cadastrar_usuario.profissao.medico}                              xpath://*[@id="input-selectProfissão"]//li[.//div[contains(text(),"MÉDICO")]]
${gestao_de_rh.cadastrar_usuario.especialidade}                                 xpath://*[@id="input-selectEspecialidades"]//span[@class="dropdown-btn"]
${gestao_de_rh.cadastrar_usuario.especialidade.clinico}                         xpath://*[@id="input-selectEspecialidades"]//li[.//div[contains(text(),"CLÍNICO")]]
${gestao_de_rh.cadastrar_usuario.numero_documento}                              xpath://input[@id="input-text-Número do documento"]
${gestao_de_rh.cadastrar_usuario.estado_documento}                              xpath://*[@id="input-selectEstado"]//span[@class="dropdown-btn"]
${gestao_de_rh.cadastrar_usuario.estado_documento.pernambuco}                   xpath://*[@id="input-selectEstado"]//li[.//div[contains(text(),"Pernambuco")]]

${gestao_de_rh.cadastrar_usuario.endereco.cep}                                  xpath://input[@id="input-text-CEP"]
${gestao_de_rh.cadastrar_usuario.endereco.endereco}                             xpath://input[@id="input-text-Endereço"]
${gestao_de_rh.cadastrar_usuario.endereco.numero}                               xpath://input[@id='input-text-Número' and contains(@class, 'ng-pristine')]
${gestao_de_rh.cadastrar_usuario.endereco.bairro}                               xpath://input[@id="input-text-Bairro"]
${gestao_de_rh.cadastrar_usuario.endereco.complemento}                          xpath://input[@id="input-text-Complemento"]
${gestao_de_rh.cadastrar_usuario.endereco.estado}                               xpath://*[@id="input-selectEstado"]//span[@class="dropdown-btn"]
# ${gestao_de_rh.cadastrar_usuario.endereco.estado.pe}                            xpath://*[@id="input-selectEstado"]//li[.//div[text()="PE"]]

${gestao_de_rh.cadastrar_usuario.botao_cadastrar}                               xpath://button[contains(text(), 'Cadastrar')]


*** Keywords ***
Acessar gestão de RH
    Wait Until Element Is Visible    ${menu.gestao_de_rh}    ${tempo_padrao}
    Mouse Over    ${menu.gestao_de_rh}

Selecionar gestão de usuários em gestão de RH
    Wait Until Element Is Visible    ${menu.gestao_de_rh.gestao_de_usuarios}    ${tempo_padrao}
    Click Element    ${menu.gestao_de_rh.gestao_de_usuarios}
    Sleep    ${tempo_minimo}
    Mouse Over    ${div_header}

Selecionar adicionar e iniciar novo cadastro
    Scroll Element Into View    ${menu.gestao_de_rh.gestao_de_usuarios.adicionar}
    Wait Until Element Is Visible    ${menu.gestao_de_rh.gestao_de_usuarios.adicionar}    ${tempo_padrao}
    Click Element    ${menu.gestao_de_rh.gestao_de_usuarios.adicionar}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${gestao_de_rh.cadastro_de_usuario.novo_cadastro}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastro_de_usuario.novo_cadastro}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.cadastro_de_usuario.novo_cadastro}
    Sleep    ${tempo_minimo}

Pesquisar usuario pelo cpf em gestão de RH
    [Arguments]    ${cpf_profissional}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${gestao_de_rh.pesquisar}
    Wait Until Element Is Visible    ${gestao_de_rh.pesquisar}    ${tempo_padrao}
    Input Text    ${gestao_de_rh.pesquisar}    ${cpf_profissional}
    Click Element    ${gestao_de_rh.botao_pesquisar}
    Sleep    ${tempo_minimo}

Pesquisar usuário pelo nome em gestão de RH
    [Arguments]    ${nome_profissional}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${gestao_de_rh.pesquisar}
    Wait Until Element Is Visible    ${gestao_de_rh.pesquisar}    ${tempo_padrao}
    Input Text    ${gestao_de_rh.pesquisar}    ${nome_profissional}
    Click Element    ${gestao_de_rh.botao_pesquisar}
    Sleep    ${tempo_minimo}

Encontrar profissional na lista e visualizar
    Scroll Element Into View    ${gestao_de_rh.profissional_encontrado}
    Wait Until Element Is Visible    ${gestao_de_rh.profissional_encontrado}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.profissional_encontrado.visualizar}
    Sleep    ${tempo_minimo}

Encontrar profissional na lista e editar
    Scroll Element Into View    ${gestao_de_rh.profissional_encontrado}
    Wait Until Element Is Visible    ${gestao_de_rh.profissional_encontrado}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.profissional_encontrado.editar}
    Sleep    ${tempo_minimo}

Encontrar usuario na lista e editar
    Scroll Element Into View    ${gestao_de_rh.usuario_encontrado}
    Wait Until Element Is Visible    ${gestao_de_rh.usuario_encontrado}    ${tempo_padrao}

    ${cpf}=    Get Text    ${gestao_de_rh.usuario_encontrado.cpf}
    Set Suite Variable    ${cpf_usuario_inativado}    ${cpf}

    Click Element    ${gestao_de_rh.usuario_encontrado.editar}
    Sleep    ${tempo_minimo}

Inativar usuario em gestão de RH
    Scroll To Top
    Sleep    ${tempo_minimo}

    Wait Until Element Is Visible    ${gestao_de_rh.cadastro_de_usuario.tornar_paciente}    ${tempo_padrao}
    Click Button    ${gestao_de_rh.cadastro_de_usuario.tornar_paciente}

    ${profissao}=    Is Multiselect Empty    ${gestao_de_rh.edicao_de_usuario.informacao.profissao}
    IF    not ${profissao}
        Log    Dropdown preenchido, executa as ações abaixo.
        Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.profissao}
        Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.informacao.profissao}    ${tempo_padrao}
        Click Element    ${gestao_de_rh.edicao_de_usuario.informacao.profissao}
        Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.profissao.medico}
        Wait Until Element Is Visible
        ...    ${gestao_de_rh.edicao_de_usuario.informacao.profissao.medico}
        ...    ${tempo_padrao}
        Click Element    ${gestao_de_rh.edicao_de_usuario.informacao.profissao.medico}
        Click Element    ${gestao_de_rh.edicao_de_usuario.informacao.profissao}
    ELSE
        Log    Dropdown vazio - Nenhuma ação necessária.    INFO
    END

    ${especialidade}=    Is Multiselect Empty    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade}
    IF    not ${especialidade}
        Log    Dropdown preenchido, executa as ações abaixo.
        Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade}
        Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade}    ${tempo_padrao}
        Click Element    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade}
        Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade.clinico}
        Wait Until Element Is Visible
        ...    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade.clinico}
        ...    ${tempo_padrao}
        Click Element    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade.clinico}
        Click Element    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade}
    ELSE
        Log    Dropdown vazio - Nenhuma ação necessária.    INFO
    END

    # Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.ativo_no_sistema}
    # Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.ativo_no_sistema}    ${tempo_padrao}
    # Sleep    ${tempo_minimo}
    # Click Element    ${gestao_de_rh.edicao_de_usuario.ativo_no_sistema}
    # Sleep    ${tempo_minimo}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.salvar}
    Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.salvar}    ${tempo_padrao}
    Click Button    ${gestao_de_rh.edicao_de_usuario.salvar}

Visualizar informações do profissional
    Scroll To Top
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.perfil}
    Sleep    ${tempo_pausa}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.agendamento_profissoes}
    Sleep    ${tempo_pausa}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.agendamento_especialidades}
    Sleep    ${tempo_pausa}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.origem_profissional}
    Sleep    ${tempo_pausa}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.tipo_de_vinculo}
    Sleep    ${tempo_pausa}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.profissao}
    Sleep    ${tempo_pausa}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade}
    Sleep    ${tempo_pausa}
    ${unidade_de_atendimento}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${gestao_de_rh.edicao_de_usuario.unidade_de_atendimento}
    ...    ${tempo_padrao}
    IF    ${unidade_de_atendimento}
        Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.unidade_de_atendimento}
        Sleep    ${tempo_pausa}
    END
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.tipo_de_escala}
    Sleep    ${tempo_pausa}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.data_de_vinculo}
    Sleep    ${tempo_pausa}
    # Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.ativo_no_sistema}
    # Sleep    ${tempo_pausa}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.voltar}
    Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.voltar}    ${tempo_padrao}
    Sleep    ${tempo_pausa}
    Click Button    ${gestao_de_rh.edicao_de_usuario.voltar}
    Scroll To Top

Editar profissional em gestão de RH
    Scroll To Top
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.perfil}
    Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.perfil}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.edicao_de_usuario.perfil}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.perfil.profissional}
    Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.perfil.profissional}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.edicao_de_usuario.perfil.profissional}

    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.agendamento_profissoes}
    Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.agendamento_profissoes}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.edicao_de_usuario.agendamento_profissoes}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.agendamento_profissoes.medico}
    Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.agendamento_profissoes.medico}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.edicao_de_usuario.agendamento_profissoes.medico}
    Click Element    ${gestao_de_rh.edicao_de_usuario.agendamento_profissoes}

    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.agendamento_especialidades}
    Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.agendamento_especialidades}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.edicao_de_usuario.agendamento_especialidades}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.agendamento_especialidades.clinico}
    Wait Until Element Is Visible
    ...    ${gestao_de_rh.edicao_de_usuario.agendamento_especialidades.clinico}
    ...    ${tempo_padrao}
    Click Element    ${gestao_de_rh.edicao_de_usuario.agendamento_especialidades.clinico}
    Click Element    ${gestao_de_rh.edicao_de_usuario.agendamento_especialidades}

    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.origem_profissional}

    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.tipo_de_vinculo}
    Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.informacao.tipo_de_vinculo}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.edicao_de_usuario.informacao.tipo_de_vinculo}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.tipo_de_vinculo.contratado_clt}
    Wait Until Element Is Visible
    ...    ${gestao_de_rh.edicao_de_usuario.informacao.tipo_de_vinculo.contratado_clt}
    ...    ${tempo_padrao}
    Click Element    ${gestao_de_rh.edicao_de_usuario.informacao.tipo_de_vinculo.contratado_clt}

    ${profissao}=    Is Multiselect Empty    ${gestao_de_rh.edicao_de_usuario.informacao.profissao}
    IF    ${profissao}
        Log    Dropdown vazio, executa as ações abaixo.
        Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.profissao}
        Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.informacao.profissao}    ${tempo_padrao}
        Click Element    ${gestao_de_rh.edicao_de_usuario.informacao.profissao}
        Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.profissao.medico}
        Wait Until Element Is Visible
        ...    ${gestao_de_rh.edicao_de_usuario.informacao.profissao.medico}
        ...    ${tempo_padrao}
        Click Element    ${gestao_de_rh.edicao_de_usuario.informacao.profissao.medico}
    ELSE
        Log    Dropdown já preenchido - Nenhuma ação necessária.    INFO
    END

    ${especialidade}=    Is Multiselect Empty    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade}
    IF    ${especialidade}
        Log    Dropdown vazio, executa as ações abaixo.
        Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade}
        Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade}    ${tempo_padrao}
        Click Element    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade}
        Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade.clinico}
        Wait Until Element Is Visible
        ...    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade.clinico}
        ...    ${tempo_padrao}
        Click Element    ${gestao_de_rh.edicao_de_usuario.informacao.especialidade.clinico}
    ELSE
        Log    Dropdown já preenchido - Nenhuma ação necessária.    INFO
    END

    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.adicionar_unidade_de_atendimento}
    Wait Until Element Is Visible
    ...    ${gestao_de_rh.edicao_de_usuario.adicionar_unidade_de_atendimento}
    ...    ${tempo_padrao}
    Click Button    ${gestao_de_rh.edicao_de_usuario.adicionar_unidade_de_atendimento}

    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.unidade_de_atendimento}
    Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.unidade_de_atendimento}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.edicao_de_usuario.unidade_de_atendimento}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.unidade_de_atendimento.sasbrasil}
    Wait Until Element Is Visible
    ...    ${gestao_de_rh.edicao_de_usuario.unidade_de_atendimento.sasbrasil}
    ...    ${tempo_padrao}
    Click Element    ${gestao_de_rh.edicao_de_usuario.unidade_de_atendimento.sasbrasil}

    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.tipo_de_escala}
    Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.tipo_de_escala}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.edicao_de_usuario.tipo_de_escala}
    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.tipo_de_escala.administrador_sas}
    Wait Until Element Is Visible
    ...    ${gestao_de_rh.edicao_de_usuario.tipo_de_escala.administrador_sas}
    ...    ${tempo_padrao}
    Click Element    ${gestao_de_rh.edicao_de_usuario.tipo_de_escala.administrador_sas}

    # Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.data_de_vinculo}
    # Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.data_de_vinculo}    ${tempo_padrao}
    # Click Element    ${gestao_de_rh.edicao_de_usuario.data_de_vinculo}
    # Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.data_de_vinculo.dia}
    # Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.data_de_vinculo.dia}    ${tempo_padrao}
    # Click Element    ${gestao_de_rh.edicao_de_usuario.data_de_vinculo.dia}

    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.calcular_carga_horaria}
    Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.calcular_carga_horaria}    ${tempo_padrao}
    Click Button    ${gestao_de_rh.edicao_de_usuario.calcular_carga_horaria}

    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.ativo_no_sistema}

    Scroll Element Into View    ${gestao_de_rh.edicao_de_usuario.salvar}
    Wait Until Element Is Visible    ${gestao_de_rh.edicao_de_usuario.salvar}    ${tempo_padrao}
    Click Button    ${gestao_de_rh.edicao_de_usuario.salvar}

Preencher formulário de cadastro profissional
    Scroll To Top
    Wait Until Element Is Visible    ${gestao_de_rh.cadastro_de_usuario.titulo}    ${tempo_padrao}

    ### Gerar cpf pela função
    ${usuario_cpf_gerado}=    Gerar Novo CPF
    Set Suite Variable    ${usuario_cpf_acesso}    ${usuario_cpf_gerado}    # torna o cpf gerado global durante o teste

    ### Gerar dados pela função
    ${usuario_dados}=    Gerar Dados Usuario    ${usuario_cpf_acesso}    ${tipo_profissional}
    Set Suite Variable    ${usuario}    ${usuario_dados}    # torna os dados gerados globais durante o teste

    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.nome}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.nome}    ${tempo_padrao}
    Input Text    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.nome}    ${usuario['nome']}
    Input Text    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.sobrenome}    ${usuario['sobrenome']}

    Input Text    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.data_de_nascimento}    ${paciente_nascimento}

    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.cpf}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.cpf}    ${tempo_padrao}
    Input Text    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.cpf}    ${usuario_cpf_gerado}

    # Input Text    ${input_cns}    ${paciente_cns}

    Input Text    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.nome_social}    ${usuario['nome_social']}
    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.genero}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.genero}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.genero}
    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.genero.cisgenero}
    Wait Until Element Is Visible
    ...    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.genero.cisgenero}
    ...    ${tempo_padrao}
    Click Element    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.genero.cisgenero}

    Click Element    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.sexo}
    Click Element    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.sexo.masculino}

    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.raca}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.raca}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.raca}
    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.raca.preta}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.raca.preta}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.raca.preta}

    Input Text    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.nome_da_mae}    ${usuario['nome_mae']}

    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.endereco.cep}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.endereco.cep}    ${tempo_padrao}
    Input Text    ${gestao_de_rh.cadastrar_usuario.endereco.cep}    ${cep}
    Sleep    ${tempo_minimo}
    # Scroll Element Into View    ${jornada_do_paciente.cadastrar.endereco.unidade_da_federacao}
    Input Text    ${gestao_de_rh.cadastrar_usuario.endereco.endereco}    ${usuario['logradouro']}
    Input Text    ${gestao_de_rh.cadastrar_usuario.endereco.numero}    ${usuario['numero']}
    Input Text    ${gestao_de_rh.cadastrar_usuario.endereco.complemento}    ${complemento}
    Input Text    ${gestao_de_rh.cadastrar_usuario.endereco.bairro}    ${usuario['bairro']}

    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.telefones.ddd}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.telefones.ddd}    ${tempo_padrao}
    Input Text    ${gestao_de_rh.cadastrar_usuario.telefones.ddd}    ${paciente_ddd}
    Input Text    ${gestao_de_rh.cadastrar_usuario.telefones.numero}    ${paciente_telefone}

    ### Gerar e-mail pela função
    ${paciente_email_cadastro}=    Gerar novo email
    Input Text    ${gestao_de_rh.cadastrar_usuario.dados_pessoais.email}    ${paciente_email_cadastro}
    Sleep    ${tempo_minimo}

    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.origem_profissional}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.origem_profissional}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.cadastrar_usuario.origem_profissional}
    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.origem_profissional.sas_brasil}
    Wait Until Element Is Visible
    ...    ${gestao_de_rh.cadastrar_usuario.origem_profissional.sas_brasil}
    ...    ${tempo_padrao}
    Click Element    ${gestao_de_rh.cadastrar_usuario.origem_profissional.sas_brasil}

    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.profissao}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.profissao}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.cadastrar_usuario.profissao}
    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.profissao.medico}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.profissao.medico}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.cadastrar_usuario.profissao.medico}
    Click Element    ${gestao_de_rh.cadastrar_usuario.profissao}

    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.especialidade}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.especialidade}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.cadastrar_usuario.especialidade}
    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.especialidade.clinico}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.especialidade.clinico}    ${tempo_padrao}
    Click Element    ${gestao_de_rh.cadastrar_usuario.especialidade.clinico}
    Click Element    ${gestao_de_rh.cadastrar_usuario.especialidade}

    Scroll Element Into View    ${gestao_de_rh.cadastrar_usuario.botao_cadastrar}
    Wait Until Element Is Visible    ${gestao_de_rh.cadastrar_usuario.botao_cadastrar}    ${tempo_padrao}
    Sleep    ${tempo_elemento}
    Click Element    ${gestao_de_rh.cadastrar_usuario.botao_cadastrar}
