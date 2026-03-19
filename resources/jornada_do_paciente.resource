*** Settings ***
Documentation       Este arquivo contém tudo relacionado aos processos da aba e telas de jornada do paciente.

Library             SeleniumLibrary
Resource            navegador.resource
Resource            dados_comuns.resource
Resource            dashboard.resource


*** Variables ***
### Variáveis que estão na tela de pesquisar paciente
${menu.jornada_do_paciente}                                                                     xpath://a[contains(., 'Jornada do Paciente')]
${menu.jornada_do_paciente.cadastrar}                                                           xpath://span[@class='hide-menu' and text()='Cadastrar']
${menu.jornada_do_paciente.pesquisar}                                                           xpath://span[@class='hide-menu' and text()='Pesquisar']
${jornada_do_paciente.pesquisar.titulo}                                                         xpath://h4[contains(@class,"page-title") and contains(text(),"Pesquisa por paciente")]
${jornada_do_paciente.cpf}                                                                      xpath://input[contains(@id,"input-text-Informe o CPF")]
${jornada_do_paciente.pesquisar}                                                                xpath://button[contains(text(),"Pesquisar")]
${jornada_do_paciente.lista_pacientes}                                                          xpath://*[@class="table-responsive ng-star-inserted"]
${jornada_do_paciente.lista_pacientes.paciente_selecionado}                                     xpath://table/tbody/tr/td[1]/span
${jornada_do_paciente.lista_pacientes.paciente_selecionado.agendar}                             xpath://button//i[@class='fa fa-calendar-alt']

### Variáveis que estão na tela de cadastrar paciente
${jornada_do_paciente.cadastrar.dados_pessoais.cpf}                                             xpath://input[@id="input-text-CPF "]    ### //label[contains(text(), 'CPF')]/following-sibling::input
${jornada_do_paciente.cadastrar.dados_pessoais.data_de_nascimento}                              xpath://input[@id="input-text-Data de nascimento"]
${jornada_do_paciente.cadastrar.dados_pessoais.email}                                           xpath://input[@id="input-text-E-mail"]
${jornada_do_paciente.cadastrar.telefones.etiqueta}                                             xpath://span[contains(@class, 'dropdown-btn')][1]
${jornada_do_paciente.cadastrar.telefones.etiqueta.contato}                                     xpath://li[contains(@class, 'multiselect-item-checkbox')]
${jornada_do_paciente.cadastrar.telefones.ddd}                                                  xpath://input[@id="input-text-DDD"]
${jornada_do_paciente.cadastrar.telefones.numero}                                               xpath://input[@id="input-text-Número"]
${jornada_do_paciente.cadastrar.verificar}                                                      xpath://button[contains(text(), 'Verificar')]
${jornada_do_paciente.cadastrar.dados_pessoais.nome}                                            xpath://input[@id="input-text-Nome "]
${jornada_do_paciente.cadastrar.dados_pessoais.sobrenome}                                       xpath://input[@id="input-text-Sobrenome "]
${jornada_do_paciente.cadastrar.dados_pessoais.nome_social}                                     xpath://input[@id="input-text-Nome social"]
${jornada_do_paciente.cadastrar.dados_pessoais.cns}                                             xpath://input[@id="input-text-Cartão SUS (CNS)"]
${jornada_do_paciente.cadastrar.dados_pessoais.genero}                                          xpath://label[contains(text(), 'Gênero')]/following::span[contains(@class, 'dropdown-btn')][1]
${jornada_do_paciente.cadastrar.dados_pessoais.genero.cisgenero}                                xpath://li[contains(@class, 'multiselect-item-checkbox') and .//input[@aria-label='Cisgênero']]//div[text()='Cisgênero']
${jornada_do_paciente.cadastrar.dados_pessoais.sexo}                                            xpath://label[contains(text(), 'Sexo')]/following::span[contains(@class, 'dropdown-btn')][1]
${jornada_do_paciente.cadastrar.dados_pessoais.sexo.masculino}                                  xpath://li[contains(@class, 'multiselect-item-checkbox') and .//input[@aria-label='Masculino']]//div[text()='Masculino']
${jornada_do_paciente.cadastrar.dados_pessoais.raca}                                            xpath://label[contains(text(), 'Raça/cor')]/following::span[contains(@class, 'dropdown-btn')][1]
${jornada_do_paciente.cadastrar.dados_pessoais.raca.preta}                                      xpath://li[contains(@class, 'multiselect-item-checkbox') and .//input[@aria-label='Preta']]//div[text()='Preta']
${jornada_do_paciente.cadastrar.dados_pessoais.etnia}                                           xpath://input[@id="input-text-Etnia"]
${jornada_do_paciente.cadastrar.dados_pessoais.nome_da_mae}                                     xpath://input[@id="input-text-Nome da Mãe"]
${jornada_do_paciente.cadastrar.endereco.cep.sim}                                               xpath://label[contains(text(), 'Sim') and .//input[@name='knowCEP']]
${jornada_do_paciente.cadastrar.endereco.cep}                                                   xpath://input[@id="input-text-CEP"]
${jornada_do_paciente.cadastrar.endereco.pesquisar_cep}                                         xpath://button[contains(text(), 'Pesquisar CEP')]
${jornada_do_paciente.cadastrar.endereco.unidade_da_federacao}                                  xpath://label[contains(text(), 'Unidade da Federação')]
${jornada_do_paciente.cadastrar.endereco.logradouro}                                            xpath://input[@id="input-text-Logradouro"]
${jornada_do_paciente.cadastrar.endereco.numero}                                                xpath://input[@id='input-text-Número' and contains(@class, 'ng-pristine')]
${jornada_do_paciente.cadastrar.endereco.bairro}                                                xpath://input[@id="input-text-Bairro"]
${jornada_do_paciente.cadastrar.endereco.complemento}                                           xpath://input[@id="input-text-Complemento"]
${jornada_do_paciente.cadastrar.observacao}                                                     xpath://textarea[@id="input-text-Observação"]
${jornada_do_paciente.cadastrar.botao_cadastrar}                                                xpath://button[contains(text(), 'Cadastrar')]
${jornada_do_paciente.cadastrar.botao_ir_para_prontuario}                                       xpath://*[@id="goToMedicalRecord"]

### Variáveis que estão na tela de prontuários do paciente
${prontuario_do_paciente.titulo}                                                                xpath://h4[contains(@class,"page-title") and contains(text(),"Prontuários do paciente")]
${prontuario_do_paciente.botao_nova_consulta}                                                   xpath://button[contains(text(),"Nova Consulta")]
${prontuario_do_paciente.botao_whatsapp}                                                        xpath://*[@id="whatsapp-secondary"]    ### //button[contains(text(),"Chat WhatsApp")]
${prontuario_do_paciente.botao_teleconsulta}                                                    xpath://*[@id="acess-teleconsultation"]
${prontuario_do_paciente.botao_fechar_videoconferencia}                                         xpath://*[@id="close-call"]
${prontuario_do_paciente.botao_iniciar_video_conferencia}                                       xpath://button[contains(text(), 'Iniciar videoconferência')]
${prontuario_do_paciente.botao_anexos}                                                          xpath://*[@id="attachments"]
${prontuario_do_paciente.botao_informar_falta}                                                  xpath://*[@id="report-absence"]

### Variáveis que estão na tela de modalidade de atendimento (presencial ou telessaúde)
${prontuario_do_paciente.modalidade_atendimento.telessaude}                                     xpath://input[@type='radio' and @value='online']
${prontuario_do_paciente.modalidade_atendimento.presencial}                                     xpath://input[@type='radio' and @value='presential']
${prontuario_do_paciente.modalidade_atendimento.botao_ok}                                       xpath://button[contains(text(),"Ok")]
${prontuario_do_paciente.modalidade_atendimento.presencial.acao}                                xpath://*[@id="input-selectSelecione a ação presencial:"]//span[@class='dropdown-btn']
${prontuario_do_paciente.modalidade_atendimento.presencial.acao.multirao}                       xpath://*[@id="input-selectSelecione a ação presencial:"]//li[.//div[text()='multirão']]

### Variáveis que estão na tela de tipos de fichas de atendimento (clínicas ou dinâmicas)
${ficha_clinica.saude_geral}                                                                    xpath://button[text()='SAÚDE DIGITAL GERAL']
${ficha_clinica.psicologia}                                                                     xpath://button[contains(text(), 'PSICOLOGIA')]
${ficha_clinica.dermatologia}                                                                   xpath://button[contains(text(), 'DERMATOLOGIA')]
${ficha_clinica.odontopediatria}                                                                xpath://button[contains(text(), 'ODONTOPEDIATRIA')]
${ficha_clinica.pediatria}                                                                      xpath://button[text()='PEDIATRIA']

${ficha_dinamica.apac}                                                                          xpath://button[contains(text(), 'APAC')]    ### Autorização de Procedimento Ambulatorial (APAC)
${ficha_dinamica.completo_09/05}                                                                xpath://button[text()='formulário completo 09/05']
${ficha_dinamica.composto_09/05}                                                                xpath://button[text()='formulario composto 09/05']
${ficha_dinamica.completo_obrigatorios}                                                         xpath://button[text()='formulário completo obrigatorios']
${ficha_dinamica.sadt}                                                                          xpath://button[contains(text(), 'SADT')]    ### Serviço de Apoio Diagnóstico Terapêutico (SADT)
${ficha_dinamica.triagem}                                                                       xpath://button[text()='triagem Avaliação de Risco Pré-operatório']    ### Triagem Avaliação de Risco Pré-operatório

${saude_geral}                                                                                  saúde geral
${psicologia}                                                                                   psicologia
${dermatologia}                                                                                 dermatologia
${odontopediatria}                                                                              odontopediatria
${pediatria}                                                                                    pediatria

### Variáveis que estão na tela de contato com paciente pelo whatsapp
${prontuario_do_paciente.whatsapp.campo_mensagem}                                               xpath://div[contains(@class, 'input-group')]//input[@type='text']
${prontuario_do_paciente.whatsapp.campo_mensagem.texto}                                         Olá, Testando Mensagem, para o Paciente de Teste.
${prontuario_do_paciente.whatsapp.botao_fechar}                                                 xpath://label[@aria-label='Close']

### Variáveis que estão na tela de contato com paciente por videoconferencia
${tela_videoconferencia}                                                                        xpath://div[contains(@class, 'elementTwilio') and contains(@class, 'boxCam')]
${tela_videoconferencia.botao_opcoes}                                                           xpath://*[@id="btnOptions"]
${tela_videoconferencia.botao_opcoes.enviar_whatsapp}                                           xpath://button[contains(text(), 'Enviar WhatsApp')]
${tela_videoconferencia.botao_fechar_videoconferencia}                                          xpath://button[contains(text(), 'Fechar videoconferência')]

### Variáveis que estão na tela de preenchimento de ficha clínica (estática): Saúde Geral [Todos os campos]
${ficha_saude_geral.unidade_de_atendimento}                                                     xpath://*[@id="input-selectEm qual unidade de atendimento foi realizado esse atendimento?"]
${ficha_saude_geral.disponibilizar_para_paciente.sim}                                           xpath://input[@name="availableToThePatient"]/parent::label[contains(text(),"Sim")]

${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}                                xpath://*[@id="input-selectClassificação geral por sintomas *"]//span[@class='dropdown-btn']
${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.itens}                          xpath://*[contains(@id,"input-selectClassificação")]/div/div[2]
${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.sintomas_ortopedicos}           xpath://*[@id="input-selectClassificação geral por sintomas *"]//li[.//div[text()='Sintomas ortopédicos']]
${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}                       xpath:(//*[@id="input-text-Descreva *"])[1]
${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas}            xpath://*[@id="input-text-Início dos sintomas *"]
${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas.data}       xpath://*[@id="input-select "]//span[@class='dropdown-btn']
${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas.dia}        xpath://*[@id="input-select "]//li[.//div[text()='Dia(s)']]
${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.duracao_outros}                 xpath://*[@id="input-text-Duração/Outros"]
${mensagem_paciente}                                                                            Mensagem Paciente

${ficha_saude_geral.hpma.descreva}                                                              xpath:(//textarea[@id="input-text-Descreva"])[1]
${ficha_saude_geral.exame_fisico.descreva}                                                      xpath:(//textarea[@id="input-text-Descreva"])[2]
${ficha_saude_geral.sinais_vitais.pa}                                                           xpath://*[@id="input-text-PA"]
${ficha_saude_geral.sinais_vitais.temperatura}                                                  xpath://*[@id="input-text-Temperatura"]
${ficha_saude_geral.sinais_vitais.fc}                                                           xpath://*[@id="input-text-FC"]
${ficha_saude_geral.sinais_vitais.fr}                                                           xpath://*[@id="input-text-FR"]
${ficha_saude_geral.sinais_vitais.oximetria}                                                    xpath://*[@id="input-text-Oximetria"]
${ficha_saude_geral.sinais_vitais.glicemia}                                                     xpath://*[@id="input-text-Glicemia"]

${ficha_saude_geral.procedimentos_realizados}                                                   xpath://*[@id="input-selectProcedimentos Realizados:"]//span[@class="dropdown-btn"]
${ficha_saude_geral.procedimentos_realizados.itens}                                             xpath://*[@id="input-selectProcedimentos Realizados:"]/div/div[2]
${ficha_saude_geral.procedimentos_realizados.atencao_primaria}                                  xpath://*[@id="input-selectProcedimentos Realizados:"]//li[.//div[contains(text(),"0301040087")]]

${ficha_saude_geral.hipotese_diagnostica.buscar_cid}                                            xpath://*[@id="input-text-Buscar CID:"]
${ficha_saude_geral.hipotese_diagnostica.cid10.texto}                                           DENGUE
${ficha_saude_geral.hipotese_diagnostica.buscar_cid.botao_buscar}                               xpath:(//button[text()=' Buscar'])[1]    ### botão buscar01
${ficha_saude_geral.hipotese_diagnostica.cid10}                                                 xpath://*[@id="input-selectCID-10:"]//span[@class="dropdown-btn"]
${ficha_saude_geral.hipotese_diagnostica.cid10.itens}                                           xpath://*[@id="input-selectCID-10:"]/div/div[2]
${ficha_saude_geral.hipotese_diagnostica.cid10.A90}                                             xpath://*[@id="input-selectCID-10:"]//li[.//div[contains(text(),"A90")]]
${ficha_saude_geral.hipotese_diagnostica.cid10.A91}                                             xpath://*[@id="input-selectCID-10:"]//li[.//div[contains(text(),"A91")]]
${ficha_saude_geral.hipotese_diagnostica.buscar_ciap2}                                          xpath://*[@id="input-text-Buscar CIAP 2:"]
${ficha_saude_geral.hipotese_diagnostica.ciap2.texto}                                           DENGUE
${ficha_saude_geral.hipotese_diagnostica.ciap2.botao_buscar}                                    xpath:(//button[text()=' Buscar'])[2]    ### botão buscar02
${ficha_saude_geral.hipotese_diagnostica.ciap2}                                                 xpath://*[@id="input-selectCIAP2:"]//span[@class="dropdown-btn"]
${ficha_saude_geral.hipotese_diagnostica.ciap2.itens}                                           xpath://*[@id="input-selectCIAP2:"]/div/div[2]
${ficha_saude_geral.hipotese_diagnostica.ciap2.A77}                                             xpath://*[@id="input-selectCIAP2:"]//li[.//div[contains(text(),"A77")]]

${ficha_saude_geral.conduta.titulo}                                                             xpath://app-formx-section//h4[contains(text(),"Conduta")]
${ficha_saude_geral.conduta.orientacoes}                                                        xpath://*[@for="input-checkbox-guidance"]    ### Orientações
${ficha_saude_geral.conduta.orientacoes.descreva}                                               xpath:(//*[@id="input-text-Descreva *"])[2]
${ficha_saude_geral.conduta.prescricao_medicamentos}                                            xpath://*[@for="input-checkbox-open_memed"]    ### Prescrição de Medicamentos MEMED
${ficha_saude_geral.conduta.exame}                                                              xpath://*[@for="input-checkbox-exam_request"]    ### Solicitação de exames
${ficha_saude_geral.conduta.exame.descreva}                                                     xpath:(//textarea[@id="input-text-Descreva"])[3]
${ficha_saude_geral.conduta.receita}                                                            xpath://*[@for="input-checkbox-recipe"]    ### Receita(Automático_MEMED)
${ficha_saude_geral.conduta.receita.descreva}                                                   xpath:(//textarea[@id="input-text-Descreva"])[4]
${ficha_saude_geral.conduta.atestado}                                                           xpath://*[@for="input-checkbox-certificate"]    ### Atestado
${ficha_saude_geral.conduta.atestado.dias}                                                      xpath://*[@id="input-text-Dias"]

${ficha_saude_geral.tela.prescricao_medicamentos}                                               xpath://iframe[@id='mdhub-module-plataforma.prescricao']
${ficha_saude_geral.tela.prescricao_medicamentos.fechar}                                        xpath://button[contains(@class, 'btn-closse--prescricao')]
${ficha_saude_geral.tela.prescricao_medicamentos.gerar_receita}                                 xpath://div[@id="page"]//button[@id="addItemBtn"]    ### //button[@id='addItemBtn']
${ficha_saude_geral.tela.prescricao_medicamentos.pesquisar}                                     xpath://*[@id="searchMedicamentos"]

${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.texto}                                Dipirona 1g
${ficha_saude_geral.tela.prescricao_medicamentos.dipirona}                                      xpath:(//span[contains(., 'Dipirona 1g')])[1]    ### //*[@id="item-a1046503030027117483"]
${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.posologia}                            xpath:(//div[@contenteditable='true'])[1]
${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.texto_posologia}                      1 comprimido a cada 8 horas
${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.quantidade}                           xpath:(//*[@id="quantity"])[1]
${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.uso_continuo}                         xpath://a[contains(@class, 'dropdown-item') and normalize-space(text()) = 'Uso Contínuo']

${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.texto}                             Paracetamol 100mg/ml
${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol}                                   xpath:(//span[contains(., 'Paracetamol')])[1]    ### //*[@id="item-w5225"]
${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.posologia}                         xpath:(//div[@contenteditable='true'])[2]
${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.posologia.tabela.item}             xpath://table[contains(@class, 'tbl-posologias')]//tbody/tr[1]
${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.quantidade}                        xpath:(//*[@id="quantity"])[2]
${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.uso_continuo}                      xpath:(//a[contains(@class, 'dropdown-item') and normalize-space(text()) = 'Uso Contínuo'])[2]

${ficha_saude_geral.tela.prescricao_medicamentos.botao_gerar_receita}                           xpath:(//*[@id="actionsButtons"])[1]
${ficha_saude_geral.tela.prescricao_medicamentos.botao_enviar_receita}                          xpath://div[@id="page"]//button[@id='imprimirPrescricao']
${ficha_saude_geral.tela.prescricao_medicamentos.botao_assinar_outra_forma}                     xpath://*[@id="DigitalSignatureDialogManualSignButton"]
${ficha_saude_geral.tela_salvar_receita}                                                        xpath://iframe[@id='mdhub-module-platform.sms-modal']
${ficha_saude_geral.tela_salvar_receita.fechar}                                                 xpath://button[@class='sc-ezbkAF dzXgUZ' and i[contains(@class, 'close')]]    ### //*[@id="root"]/button/i[@class="md-icon close"]
${ficha_saude_geral.tela_dados_profissional_memed.endereco}                                     xpath://*[@id="profissional[endereco]"]
${ficha_saude_geral.tela_dados_profissional_memed.cidade}                                       xpath://*[@id="profissional[cidades_id]-selectized"]
${ficha_saude_geral.tela_dados_profissional_memed.cidade.afogados}                              xpath://div[@class='selectize-dropdown-content']//div[contains(., 'Afogados da Ingazeira - PE')]
${ficha_saude_geral.tela_dados_profissional_memed.endereco.numero}                              xpath://*[@id="profissional[telefone]"]
${ficha_saude_geral.tela_dados_profissional_memed.continuar}                                    xpath://*[@id="continuar"]

${ficha_saude_geral.seguimento.solicitar_matriciamento}                                         xpath://*[@for="input-checkbox-matrix_support_request"]    ### Solicitar Matriciamento
${ficha_saude_geral.seguimento.matriciamento.grupo_de_pacientes}                                xpath://*[@id="input-selectGrupo de pacientes"]//span[@class="dropdown-btn"]
${ficha_saude_geral.seguimento.matriciamento.grupo_de_pacientes.padrao}                         xpath://*[@id="input-selectGrupo de pacientes"]//li[.//div[contains(text(),"PADRÃO")]]
${ficha_saude_geral.seguimento.matriciamento.especialidade}                                     xpath://*[@id="input-selectEspecialidades:"]//span[@class="dropdown-btn"]
${ficha_saude_geral.seguimento.matriciamento.especialidade.dentistica}                          xpath://div[@class='dropdown-list']//li[.//input[normalize-space(@aria-label)='CIRURGIAO DENTISTA DENTISTICA']]    # //li[.//input[@aria-label='CIRURGIAO DENTISTA    DENTISTICA']]
${ficha_saude_geral.seguimento.matriciamento.botao_salvar}                                      xpath://button[contains(., 'Salvar')]
${ficha_saude_geral.seguimento.matriciamento.botao_fechar}                                      xpath://button[contains(., 'Fechar')]
${ficha_saude_geral.seguimento.reavaliacao}                                                     xpath://*[@for="input-checkbox-revaluation"]    ### Reavaliação/Monitoramento
${ficha_saude_geral.seguimento.reavaliacao.selecione_data}                                      xpath://input[@type="text" and @placeholder="Selecione o dia"]
${ficha_saude_geral.seguimento.reavaliacao.dia}                                                 xpath://span[contains(@class, 'flatpickr-day') and @aria-current="date"]
${ficha_saude_geral.seguimento.reavaliacao.tipo_profissional}                                   xpath://*[@id="input-selectTipo de profissional?"]//span[@class='dropdown-btn']
${ficha_saude_geral.seguimento.reavaliacao.tipo_profissional.medico}                            xpath://*[@id="input-selectTipo de profissional?"]//li[.//input[@aria-label='Médico']]
${ficha_saude_geral.seguimento.reavaliacao.necessita_apoio}                                     xpath://*[@for="input-checkbox-needs_team_support"]
${ficha_saude_geral.seguimento.encaminhamento}                                                  xpath://*[@for="input-checkbox-forwarding"]    ### Encaminhamento Especialidades
${ficha_saude_geral.seguimento.encaminhamento.online}                                           xpath://*[@id="presential_avaliation"]/label[contains(text(),"Online")]
${ficha_saude_geral.seguimento.encaminhamento_UPA}                                              xpath://*[@for="input-checkbox-find_ps"]    ### Encaminhamento UPA
${ficha_saude_geral.seguimento.alta}                                                            xpath://*[@for="input-checkbox-high"]    ### //*[@for="input-checkbox-high"]    # alta

${ficha_saude_geral.botao_solicitar_interconsulta}                                              xpath://button[contains(., 'Solicitar Interconsulta')]
${ficha_saude_geral.solicitar_interconsulta.adicionar_especialidade}                            xpath://button[contains(., ' Adicionar especialidade')]
${ficha_saude_geral.interconsulta.area}                                                         xpath://*[@id="input-selectÁrea"]//span[@class="dropdown-btn"]
${ficha_saude_geral.interconsulta.area.medico}                                                  xpath://*[@id="input-selectÁrea"]//li[.//div[text()="MÉDICO"]]
${ficha_saude_geral.interconsulta.especialidade}                                                xpath://*[@id="input-selectEspecialidade"]//span[@class="dropdown-btn"]
${ficha_saude_geral.interconsulta.especialidade.cirurgiao_geral}                                xpath://*[@id="input-selectEspecialidade"]//li[.//div[contains(text(),"MEDICO CIRURGIAO GERAL")]]
${ficha_saude_geral.interconsulta.classificacao}                                                xpath://*[@id="input-selectClassificação de Risco"]//span[@class="dropdown-btn"]
${ficha_saude_geral.interconsulta.classificacao.amarelo}                                        xpath://*[@id="input-selectClassificação de Risco"]//li[.//div[contains(text(),"Amarelo")]]
${ficha_saude_geral.interconsulta.solicitacao}                                                  xpath://*[@id="input-selectSolicitação"]//span[@class="dropdown-btn"]
${ficha_saude_geral.interconsulta.solicitacao.parecer}                                          xpath://*[@id="input-selectSolicitação"]//li[.//div[contains(text(),"Parecer")]]
${ficha_saude_geral.interconsulta.prioridade}                                                   xpath://*[@id="input-selectPrioridade"]//span[@class="dropdown-btn"]
${ficha_saude_geral.interconsulta.prioridade.teste}                                             xpath://*[@id="input-selectPrioridade"]//li[.//div[contains(text(),"Cuidado compartilhado")]]
${ficha_saude_geral.interconsulta.descreva}                                                     xpath://*[@id="input-text-Descreva em detalhes sobre sua solicitação de interconsulta para esta especialidade:"]
${fichas.solicitar_interconsulta.botao_anexar_exames}                                           xpath://button[contains(., 'Anexar arquivos')]

${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}                                   xpath://button[contains(., ' Gerar interconsultas')]

${ficha_saude_geral.botao_concluir}                                                             xpath://button[.//span[text()='Concluído']]
${ficha_saude_geral.botao_finalizar}                                                            xpath://button[contains(., 'Finalizar')]
${ficha_saude_geral.botao_salvar}                                                               xpath://button[contains(., 'Salvar')]

### Variáveis que estão na tela de pesquisa de consulta
${tela_pesquisa.titulo}                                                                         xpath://h3[contains(text(),"Box de encerramento de consulta")]
${tela_pesquisa.subtitulo}                                                                      xpath://h4[contains(text(),"Avaliação de atendimento")]
${tela_pesquisa.atendimento_completo.sim}                                                       xpath://*[@id="is_full_online"]/label[contains(text(),"Sim")]
${tela_pesquisa.atendimento_plataforma.sim}                                                     xpath://*[@id="online_medicalrecord_to_presencial"]/label[contains(text(),"Sim")]
${tela_pesquisa.pronto_atendimento.sim}                                                         xpath://*[@id="medicalrecord_to_medical_assistance"]/label[contains(text(),"Sim")]
${tela_pesquisa.atendimento_infraestrutura.sim}                                                 xpath://*[@id="medicalrecord_using_patient_infra"]/label[contains(text(),"Sim")]
${tela_pesquisa.resolvido.sim}                                                                  xpath://*[@id="purpose_of_teleconsultation_resolved"]/label[contains(text(),"Sim")]
${tela_pesquisa.satisfacao.sim}                                                                 xpath://*[@id="sias_user_satisfaction_assessment"]/label[5]
${tela_pesquisa.satisfacao.comentarios}                                                         xpath://*[@id="input-text-Comentários"]
${tela_pesquisa.botao_finalizar_e_salvar}                                                       xpath://button[contains(text(),"Finalizar e Salvar")]

### Variáveis que estão na tela de anexos de fichas clinicas
${tela_anexos.botao_anexar_imagens}                                                             xpath://button[normalize-space()='Anexar imagem']
${tela_anexos.selecionar_arquivo}                                                               xpath://input[@type='file' and @id='uploadFile']
${tela_anexos.arquivo_carregado}                                                                ${resources}/anexos/img-teste.jpg
${tela_anexos.botao_carregar_todos}                                                             xpath://button[text()=' Enviar todos ']
${tela_anexos.botao_voltar}                                                                     xpath://div[contains(@class, 'modal-footer')]//button[text()='Voltar']    ### //button[text()='Voltar']
${ficha_dinamica.tela_anexos.botao_capturar_imagem}                                             xpath://a[normalize-space()='Capturar']

### Variáveis de imagens de anexos
${arquivo_anexo.raio-x-anexo}                                                                   ${resources}/anexos/raio-x-anexo.png
${arquivo_anexo.catapora-anexo}                                                                 ${resources}/anexos/catapora-anexo.jpg
${arquivo_anexo.dente-cariado-anexo}                                                            ${resources}/anexos/dente-cariado-anexo.jpg
${arquivo_anexo.gastrite-anexo}                                                                 ${resources}/anexos/gastrite-anexo.png
${arquivo_anexo.hemograma-anexo}                                                                ${resources}/anexos/hemograma-anexo.png
${arquivo_anexo.psoriase_anexo}                                                                 ${resources}/anexos/psoriase-anexo.jpg
${tela_anexos.arquivo_carregado}                                                                ${resources}/anexos/img-teste.jpg    ### C:\\Users\\faonictor\\Downloads\\drivers\\img-teste.jpg

### Variáveis que estão na tela de anexos prontuario paciente
${prontuario_do_paciente.tela_anexos.selecionar_arquivo}                                        xpath://input[@type='file' and @id='customFile']
${prontuario_do_paciente.tela_anexos.carregar_arquivo}                                          xpath://button[contains(text(),"Carregar")]
${prontuario_do_paciente.tela_anexos.nome_arquivo_carregado}                                    xpath://*[@id="customFileLabel"]
${prontuario_do_paciente.tela_anexos.botao_fechar}                                              xpath://button[text()='Fechar']

### Variáveis que estão na tela de informar falta de paciente
${tela_registrar_falta_do_paciente.unidade_de_atendimento}                                      xpath://*[@id="input-selectEm qual unidade de atendimento seria realizado esse atendimento?"]//span[@class='dropdown-btn']
${tela_registrar_falta_do_paciente.unidade_de_atendimento.smart}                                xpath://*[@id="input-selectEm qual unidade de atendimento seria realizado esse atendimento?"]//li[.//div[text()='Telessaúde SUS']]
${tela_registrar_falta_do_paciente.botao_ok}                                                    xpath://button[contains(text(), 'Ok')]

### Variáveis que estão na tela de assinatura digital ao final do atendimento
${tela_assinatura_digital.fechar}                                                               xpath://button[text()="Fechar"]

### Variáveis que estão na tela de preenchimento de ficha clínica (estática): Psicologia [Apenas campos obrigatórios]
${ficha_psicologia.dados_da_consulta.historico_do_paciente}                                     xpath://*[@id="input-text-Histórico do paciente *"]
${ficha_psicologia.dados_da_consulta.queixa_da_sessao}                                          xpath://*[@id="input-selectQueixa da sessão *"]//span[@class="dropdown-btn"]
${ficha_psicologia.dados_da_consulta.queixa_da_sessao.ansiedade}                                xpath://*[@id="input-selectQueixa da sessão *"]//li[.//div[contains(text(),"Ansiedade")]]
${ficha_psicologia.dados_da_consulta.hipotese_diagnostica}                                      xpath://*[@id="input-selectHipótese diagnóstica *"]//span[@class="dropdown-btn"]
${ficha_psicologia.dados_da_consulta.hipotese_diagnostica.estresse}                             xpath://*[@id="input-selectHipótese diagnóstica *"]//li[.//div[contains(text(),"Estresse")]]
${ficha_psicologia.evolucao}                                                                    xpath://*[@id="input-selectEscolha *"]//span[@class="dropdown-btn"]
${ficha_psicologia.evolucao.sem_mudança}                                                        xpath://*[@id="input-selectEscolha *"]//li[.//div[contains(text(),"Sem mudança")]]
${ficha_psicologia.orientacoes.descreva}                                                        xpath:(//*[@id="input-text-Descreva"])[2]

### Variáveis que estão na tela de preenchimento de ficha clínica (estática): Dermatologia [Apenas campos obrigatórios]
${ficha_dermatologia.ja_teve_cancer_de_pele}                                                    xpath://*[@for="input-checkbox-has_cancer"]
${ficha_dermatologia.outra_doenca_dermatologica}                                                xpath://*[@for="input-checkbox-guideline"]
${ficha_dermatologia.tipo_de_cancer}                                                            xpath://*[@id="input-selectQual tipo?"]//span[@class="dropdown-btn"]
${ficha_dermatologia.tipo_de_cancer.nao_informado}                                              xpath://*[@id="input-selectQual tipo?"]//li[.//div[contains(text(),"Não informado")]]
${ficha_dermatologia.orientacoes.descreva}                                                      xpath://*[@id="input-text-Descreva:"]

### Variáveis que estão na tela de preenchimento de ficha clínica (estática): Pediatria [Apenas campos obrigatórios]
${ficha_pediatria.queixa_duracao_dos_sintomas}                                                  xpath://*[@id="input-text-Queixa e/ou Duração dos Sintomas"]
${ficha_pediatria.hipotese_diagnostica}                                                         xpath://*[@id="input-selectClassificação geral por sintomas *"]//span[@class="dropdown-btn"]
${ficha_pediatria.hipotese_diagnostica.sintomas_ortopedicos}                                    xpath://*[@id="input-selectClassificação geral por sintomas *"]//li[.//div[contains(text(),"Sintomas ortopédicos")]]
${ficha_pediatria.orientacoes}                                                                  xpath://*[@for="input-checkbox-guidance"]
${ficha_pediatria.orientacoes.descreva}                                                         xpath:(//*[@id="input-text-Descreva *"])[2]

### Variáveis que estão distribuidas nas telas genéricas de fichas dinâmicas
${ficha_dinamica.teste_lista}                                                                   xpath://*[@id="input-selectTestando lista"]//span[@class='dropdown-btn']
${ficha_dinamica.teste_lista.item1}                                                             xpath://*[@id="input-selectTestando lista"]//li[.//div[text()='Testando lista 1']]
${ficha_dinamica.teste_lista.item2}                                                             xpath://*[@id="input-selectTestando lista"]//li[.//div[text()='Testando lista 2']]
${ficha_dinamica.teste_lista.item3}                                                             xpath://*[@id="input-selectTestando lista"]//li[.//div[text()='Testando lista 3']]
${ficha_dinamica.teste_lista_opcoes1}                                                           xpath://label[contains(text(), 'Testando radio lista 1')]
${ficha_dinamica.teste_lista_opcoes2}                                                           xpath://label[contains(text(), 'Testando radio lista 2')]
${ficha_dinamica.teste_lista_opcoes3}                                                           xpath://label[contains(text(), 'Testando radio lista 3')]
${ficha_dinamica.teste_item1}                                                                   xpath://*[@for="input-checkbox-1693"]
${ficha_dinamica.teste_item2}                                                                   xpath://*[@for="input-checkbox-1694"]
${ficha_dinamica.teste_item3}                                                                   xpath://*[@for="input-checkbox-1696"]
${ficha_dinamica.teste_caixa_de_texto}                                                          xpath://*[@id="input-text-Testando caixa de texto"]
${ficha_dinamica.teste_area_de_texto}                                                           xpath://*[@id="input-text-Testando area de texto"]
${ficha_dinamica.teste_campo_de_data}                                                           xpath://input[@type="text" and @placeholder="Selecione o dia"]
${ficha_dinamica.teste_campo_de_data.dia}                                                       xpath:(//span[contains(@class, 'flatpickr-day') and @aria-current="date"])[1]
${ficha_dinamica.teste_campo_numerico}                                                          xpath://*[@id="input-text-Testando campo numerico"]
${ficha_dinamica.teste.titulo}                                                                  xpath://h3[contains(@class, 'text-uppercase') and normalize-space()='>Titulo<']
${ficha_dinamica.teste.subtitulo}                                                               xpath://h4[contains(@class, 'card-title') and normalize-space()='Subtitulo']
${ficha_dinamica.teste.autotexto}                                                               xpath://p[contains(@class, 'ng-star-inserted') and normalize-space()='Autotexto']

${ficha_dinamica.adicionar_exames.titulo}                                                       xpath://h4[contains(@class, 'card-title') and normalize-space()='Exames Realizados']
${ficha_dinamica.botao_adicionar_exames}                                                        xpath://button[text()='Adicionar exame']
${ficha_dinamica.exame_realizado}                                                               xpath://*[@id="input-selectExame Realizado"]//span[@class="dropdown-btn"]
${ficha_dinamica.exame_realizado.exame_teste}                                                   xpath://*[@id="input-selectExame Realizado"]//li[.//input[@aria-label='exame teste']]
${ficha_dinamica.campo_data1}                                                                   xpath:(//input[@type="text" and @placeholder="Selecione o dia"])[2]
${ficha_dinamica.campo_data1.dia1}                                                              xpath:(//span[contains(@class, 'flatpickr-day') and @aria-current="date"])[2]
${ficha_dinamica.campo_data2}                                                                   xpath:(//input[@type="text" and @placeholder="Selecione o dia"])[3]
${ficha_dinamica.campo_data2.dia2}                                                              xpath:(//span[contains(@class, 'flatpickr-day') and @aria-current="date"])[3]
${ficha_dinamica.orientacoes.descreva}                                                          xpath://*[@id="input-text-Descreva *"]
${ficha_dinamica.exame.descreva}                                                                xpath:(//textarea[@id="input-text-Descreva"])[1]
${ficha_dinamica.receita.descreva}                                                              xpath:(//textarea[@id="input-text-Descreva"])[2]
${ficha_dinamica.matriciamento}                                                                 xpath://*[@for="input-checkbox-telematricing"]
${ficha_dinamica.encaminhamento}                                                                xpath://*[@id="presential_avaliation_text"]/label[contains(text(),"Online")]
${ficha_dinamica.tela_anexos.botao_anexar_imagem}                                               xpath://*[@id="input-text-testando anexar imagens"]
${ficha_dinamica.tela_anexos.botao_voltar}                                                      xpath://button[text()='Voltar']
${ficha_dinamica.tela_anexos.botao_capturar_imagem}                                             xpath://a[normalize-space()='Capturar']
${ficha_dinamica.tela_anexos.anexar_exames}                                                     xpath://button[normalize-space()='upload da imagem']    ### //*[@id="input-text-anexar exames"]
${ficha_dinamica.solicitar_interconsultas}                                                      xpath://button[contains(., 'Ok')]
${ficha_dinamica.botao_finalizar}                                                               xpath://button[normalize-space()='Finalizar']
${ficha_dinamica.botao_concluido}                                                               xpath://button[normalize-space()='Concluído']

### Variáveis que estão na tela de interconsultas na tabela listagem de pacientes
${minhas_interconsultas.tabela_paciente.paciente_01}                                            (//td//span[contains(text(), 'PACIENTE 01')])[1]


*** Keywords ***
Acessar rota do dashboard
    Scroll Element Into View    ${dashboard.botão.AnexarDocumentos} 
    Wait Until Element Is Visible    ${dashboard.botão.AnexarDocumentos}     ${tempo_padrao}
    Click Element    ${dashboard.botão.AnexarDocumentos}

Acessar jornada do paciente
    Wait Until Element Is Visible    ${menu.jornada_do_paciente}    ${tempo_padrao}
    Mouse Over    ${menu.jornada_do_paciente}

Acessar interconsultas
    Wait Until Element Is Visible    ${menu.Interconsultas}    ${tempo_padrao}
    Mouse Over    ${menu.Interconsultas}

Selecionar minhas interconsultas
    Wait Until Element Is Visible    ${menu.Interconsultas.minhas_interconsultas}    ${tempo_padrao}
    Click Element    ${menu.Interconsultas.minhas_interconsultas}
    Sleep    ${tempo_minimo}
    Mouse Over    ${div_header}

Selecionar cadastrar em jornada do paciente
    Wait Until Element Is Visible    ${menu.jornada_do_paciente.cadastrar}    ${tempo_padrao}
    Click Element    ${menu.jornada_do_paciente.cadastrar}
    Sleep    ${tempo_minimo}
    Mouse Over    ${div_header}

Selecionar pesquisar em jornada do paciente
    Wait Until Element Is Visible    ${menu.jornada_do_paciente.pesquisar}    ${tempo_padrao}
    Click Element    ${menu.jornada_do_paciente.pesquisar}
    Sleep    ${tempo_minimo}
    Mouse Over    //header

Pesquisar um paciente pelo cpf
    [Arguments]    ${cpf_paciente_pesquisa}
    Wait Until Element Is Visible    ${jornada_do_paciente.pesquisar.titulo}    ${tempo_padrao}
    Input Text    ${jornada_do_paciente.cpf}    ${cpf_paciente_pesquisa}

Clicar no botão pesquisar paciente
    Wait Until Element Is Enabled    ${jornada_do_paciente.pesquisar}    ${tempo_padrao}
    Click Button    ${jornada_do_paciente.pesquisar}

Encontrar paciente em lista
    # [Arguments]    ${cpf_paciente_pesquisa}
    # Page Should Contain Element    //tbody//td[2][contains(text(),"${cpf_paciente_pesquisa}")]    60s
    # Scroll Element Into View    //table/tbody/tr/td[1]/span
    Wait Until Element Is Enabled    ${jornada_do_paciente.lista_pacientes}    ${tempo_padrao}
    Scroll Element Into View    ${jornada_do_paciente.lista_pacientes.paciente_selecionado}
    Wait Until Element Is Visible    ${jornada_do_paciente.lista_pacientes.paciente_selecionado}    ${tempo_padrao}
    Sleep    ${tempo_minimo}

Encontrar paciente em lista de interconsultas
    Wait Until Element Is Enabled    ${minhas_interconsultas.tabela_paciente.paciente_01}    ${tempo_padrao}
    Scroll Element Into View    ${minhas_interconsultas.tabela_paciente.paciente_01}
    Wait Until Element Is Visible    ${minhas_interconsultas.tabela_paciente.paciente_01}    ${tempo_padrao}
    Sleep    ${tempo_minimo}

Abrir ficha do paciente
    Click Element    ${jornada_do_paciente.lista_pacientes.paciente_selecionado}
    Wait Until Element Is Visible    ${prontuario_do_paciente.titulo}    ${tempo_padrao}

Realizar nova consulta do paciente
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${prontuario_do_paciente.botao_nova_consulta}
    Wait Until Element Is Visible    ${prontuario_do_paciente.botao_nova_consulta}    ${tempo_padrao}
    Click Button    ${prontuario_do_paciente.botao_nova_consulta}

Realizar atendimento telessaúde
    Sleep    ${tempo_minimo}
    Wait Until Element Is Visible    ${prontuario_do_paciente.modalidade_atendimento.telessaude}    ${tempo_padrao}
    Click Element    ${prontuario_do_paciente.modalidade_atendimento.telessaude}
    Sleep    ${tempo_minimo}
    Click Element    ${prontuario_do_paciente.modalidade_atendimento.botao_ok}

Realizar atendimento presencial
    Sleep    ${tempo_minimo}
    Wait Until Element Is Visible    ${prontuario_do_paciente.modalidade_atendimento.presencial}    ${tempo_padrao}
    Click Element    ${prontuario_do_paciente.modalidade_atendimento.presencial}
    Sleep    ${tempo_minimo}
    Click Element    ${prontuario_do_paciente.modalidade_atendimento.presencial.acao}
    Wait Until Element Is Visible
    ...    ${prontuario_do_paciente.modalidade_atendimento.presencial.acao.multirao}
    ...    ${tempo_padrao}
    Click Element    ${prontuario_do_paciente.modalidade_atendimento.presencial.acao.multirao}
    Sleep    ${tempo_minimo}
    Click Element    ${prontuario_do_paciente.modalidade_atendimento.botao_ok}

Enviar mensagem ao paciente pelo whatsapp
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${prontuario_do_paciente.botao_whatsapp}
    Wait Until Element Is Visible    ${prontuario_do_paciente.botao_whatsapp}    ${tempo_padrao}
    Click Button    ${prontuario_do_paciente.botao_whatsapp}
    Set Focus To Element    ${prontuario_do_paciente.whatsapp.campo_mensagem}
    Input Text
    ...    ${prontuario_do_paciente.whatsapp.campo_mensagem}
    ...    ${prontuario_do_paciente.whatsapp.campo_mensagem.texto}
    Sleep    ${tempo_minimo}
    Press Keys    None    ENTER
    Sleep    ${tempo_minimo}
    Click Element    ${prontuario_do_paciente.whatsapp.botao_fechar}

Informar falta de paciente
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${prontuario_do_paciente.botao_informar_falta}
    Wait Until Element Is Visible    ${prontuario_do_paciente.botao_informar_falta}    ${tempo_padrao}
    Click Element    ${prontuario_do_paciente.botao_informar_falta}
    Sleep    ${tempo_minimo}
    Wait Until Element Is Visible    ${tela_registrar_falta_do_paciente.unidade_de_atendimento}    ${tempo_padrao}
    Click Element    ${tela_registrar_falta_do_paciente.unidade_de_atendimento}
    Scroll Element Into View    ${tela_registrar_falta_do_paciente.unidade_de_atendimento.smart}
    Wait Until Element Is Visible
    ...    ${tela_registrar_falta_do_paciente.unidade_de_atendimento.smart}
    ...    ${tempo_padrao}
    Click Element    ${tela_registrar_falta_do_paciente.unidade_de_atendimento.smart}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${tela_registrar_falta_do_paciente.botao_ok}
    Wait Until Element Is Enabled    ${tela_registrar_falta_do_paciente.botao_ok}    ${tempo_padrao}
    Click Element    ${tela_registrar_falta_do_paciente.botao_ok}
    Sleep    ${tempo_minimo}

Iniciar videoconferencia com o paciente
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${prontuario_do_paciente.botao_teleconsulta}
    Wait Until Element Is Visible    ${prontuario_do_paciente.botao_teleconsulta}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Button    ${prontuario_do_paciente.botao_teleconsulta}
    Wait Until Element Is Visible    ${prontuario_do_paciente.botao_iniciar_video_conferencia}    ${tempo_padrao}
    Click Button    ${prontuario_do_paciente.botao_iniciar_video_conferencia}
    Sleep    ${tempo_padrao}
    Wait Until Element Is Visible    ${tela_videoconferencia.botao_opcoes}    ${tempo_padrao}
    Click Button    ${tela_videoconferencia.botao_opcoes}
    Wait Until Element Is Visible    ${tela_videoconferencia.botao_opcoes.enviar_whatsapp}    ${tempo_padrao}
    Click Button    ${tela_videoconferencia.botao_opcoes.enviar_whatsapp}

Arrastar caixa de videoconferência
    [Documentation]    Precisei utilizar java script para mover a tela. #Drag And Drop Elements é uma personal keyword
    [Arguments]    ${offset_y}
    Wait Until Element Is Visible    ${tela_videoconferencia}    ${tempo_maximo}
    Drag And Drop Elements    ${offset_y}    ${tela_videoconferencia}

Arrastar caixa de videoconferência - Legado    ### Desativado não funcionou não arrasta com drag mesmo clicando
    [Arguments]    ${offset_y}
    Wait Until Element Is Visible    ${tela_videoconferencia}    ${tempo_maximo}
    ${elemento} =    Get WebElement    ${tela_videoconferencia}
    Set Focus To Element    ${elemento}
    Mouse Down    ${elemento}
    # Drag And Drop By Offset    //div[contains(@class, 'elementTwilio') and contains(@class, 'boxCam')]    0    -300
    Drag And Drop By Offset    ${elemento}    0    ${offset_y}

Fechar videoconferencia com o paciente
    Wait Until Element Is Visible    ${tela_videoconferencia.botao_fechar_videoconferencia}    ${tempo_padrao}
    Click Button    ${tela_videoconferencia.botao_fechar_videoconferencia}
    Sleep    ${tempo_elemento}

# Encerrar videoconferencia na ficha
#    Scroll To Top
#    Sleep    ${tempo_minimo}
#    Scroll Element Into View    ${prontuario_do_paciente.botao_fechar_videoconferencia}
#    Wait Until Element Is Visible    ${prontuario_do_paciente.botao_fechar_videoconferencia}    ${tempo_maximo}
#    Click Element    ${prontuario_do_paciente.botao_fechar_videoconferencia}

Preencher formulário de cadastro paciente parte 1
    ### Gerar cpf pela função
    ${usuario_cpf_gerado}    Gerar Novo CPF    
    Set Suite Variable    ${usuario_cpf_acesso}    ${usuario_cpf_gerado}    # torna o cpf gerado global durante o teste

    Scroll Element Into View    ${jornada_do_paciente.cadastrar.dados_pessoais.cpf}
    Wait Until Element Is Visible    ${jornada_do_paciente.cadastrar.dados_pessoais.cpf}    ${tempo_padrao}
    Input Text    ${jornada_do_paciente.cadastrar.dados_pessoais.cpf}    ${usuario_cpf_gerado}
    Input Text    ${jornada_do_paciente.cadastrar.dados_pessoais.data_de_nascimento}    ${paciente_nascimento}

    ### Gerar e-mail pela função
    ${paciente_email_cadastro} =    Gerar novo email
    Input Text    ${jornada_do_paciente.cadastrar.dados_pessoais.email}    ${paciente_email_cadastro}

    Scroll Element Into View    ${jornada_do_paciente.cadastrar.telefones.etiqueta}
    Wait Until Element Is Visible    ${jornada_do_paciente.cadastrar.telefones.etiqueta}    ${tempo_padrao}
    Click Element    ${jornada_do_paciente.cadastrar.telefones.etiqueta}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${jornada_do_paciente.cadastrar.telefones.etiqueta.contato}
    Wait Until Element Is Visible    ${jornada_do_paciente.cadastrar.telefones.etiqueta.contato}    ${tempo_padrao}
    Click Element    ${jornada_do_paciente.cadastrar.telefones.etiqueta.contato}
    Input Text    ${jornada_do_paciente.cadastrar.telefones.ddd}    ${paciente_ddd}
    Input Text    ${jornada_do_paciente.cadastrar.telefones.numero}    ${paciente_telefone}
    Scroll Element Into View    ${jornada_do_paciente.cadastrar.verificar}
    Wait Until Element Is Visible    ${jornada_do_paciente.cadastrar.verificar}    ${tempo_padrao}
    Click Element    ${jornada_do_paciente.cadastrar.verificar}

Preencher formulário de cadastro paciente parte 2
    # Input Text    ${input_cns}    ${paciente_cns}

    ### Gerar dados pela função
    ${usuario_dados}    Gerar Dados Usuario    ${usuario_cpf_acesso}    ${tipo_profissional}=paciente
    Set Suite Variable    ${usuario}    ${usuario_dados}    # torna os dados gerados globais durante o teste

    Scroll Element Into View    ${jornada_do_paciente.cadastrar.dados_pessoais.nome}
    Wait Until Element Is Visible    ${jornada_do_paciente.cadastrar.dados_pessoais.nome}    ${tempo_padrao}
    Input Text    ${jornada_do_paciente.cadastrar.dados_pessoais.nome}    ${usuario['nome']}
    Input Text    ${jornada_do_paciente.cadastrar.dados_pessoais.sobrenome}    ${usuario['sobrenome']}
    Input Text    ${jornada_do_paciente.cadastrar.dados_pessoais.nome_social}    ${usuario['nome_social']}
    Scroll Element Into View    ${jornada_do_paciente.cadastrar.dados_pessoais.genero}
    Wait Until Element Is Visible    ${jornada_do_paciente.cadastrar.dados_pessoais.genero}    ${tempo_padrao}
    Click Element    ${jornada_do_paciente.cadastrar.dados_pessoais.genero}
    Scroll Element Into View    ${jornada_do_paciente.cadastrar.dados_pessoais.genero.cisgenero}
    Wait Until Element Is Visible
    ...    ${jornada_do_paciente.cadastrar.dados_pessoais.genero.cisgenero}
    ...    ${tempo_padrao}
    Click Element    ${jornada_do_paciente.cadastrar.dados_pessoais.genero.cisgenero}
    Click Element    ${jornada_do_paciente.cadastrar.dados_pessoais.sexo}
    Click Element    ${jornada_do_paciente.cadastrar.dados_pessoais.sexo.masculino}
    Scroll Element Into View    ${jornada_do_paciente.cadastrar.dados_pessoais.raca}
    Wait Until Element Is Visible    ${jornada_do_paciente.cadastrar.dados_pessoais.raca}    ${tempo_padrao}
    Click Element    ${jornada_do_paciente.cadastrar.dados_pessoais.raca}
    Scroll Element Into View    ${jornada_do_paciente.cadastrar.dados_pessoais.raca.preta}
    Wait Until Element Is Visible    ${jornada_do_paciente.cadastrar.dados_pessoais.raca.preta}    ${tempo_padrao}
    Click Element    ${jornada_do_paciente.cadastrar.dados_pessoais.raca.preta}
    Input Text    ${jornada_do_paciente.cadastrar.dados_pessoais.etnia}    ${etnia}
    Input Text    ${jornada_do_paciente.cadastrar.dados_pessoais.nome_da_mae}    ${usuario['nome_mae']}

Preencher formulário de cadastro paciente parte 3
    Scroll Element Into View    ${jornada_do_paciente.cadastrar.endereco.cep.sim}
    Wait Until Element Is Visible    ${jornada_do_paciente.cadastrar.endereco.cep.sim}    ${tempo_padrao}
    Click Element    ${jornada_do_paciente.cadastrar.endereco.cep.sim}
    Scroll Element Into View    ${jornada_do_paciente.cadastrar.endereco.cep}
    Wait Until Element Is Visible    ${jornada_do_paciente.cadastrar.endereco.cep}    ${tempo_padrao}
    Input Text    ${jornada_do_paciente.cadastrar.endereco.cep}    ${cep}
    Click Button    ${jornada_do_paciente.cadastrar.endereco.pesquisar_cep}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${jornada_do_paciente.cadastrar.endereco.unidade_da_federacao}
    Input Text    ${jornada_do_paciente.cadastrar.endereco.logradouro}    ${usuario['logradouro']}
    Sleep    ${tempo_minimo}
    Input Text    ${jornada_do_paciente.cadastrar.endereco.numero}    ${usuario['numero']}
    Input Text    ${jornada_do_paciente.cadastrar.endereco.bairro}    ${usuario['bairro']}
    Input Text    ${jornada_do_paciente.cadastrar.endereco.complemento}    ${complemento}
    Scroll Element Into View    ${jornada_do_paciente.cadastrar.observacao}
    Input Text    ${jornada_do_paciente.cadastrar.observacao}    ${observacao}
    Scroll Element Into View    ${jornada_do_paciente.cadastrar.botao_cadastrar}
    Wait Until Element Is Visible    ${jornada_do_paciente.cadastrar.botao_cadastrar}    ${tempo_padrao}
    Sleep    ${tempo_elemento}
    Click Element    ${jornada_do_paciente.cadastrar.botao_cadastrar}

# Recusar assinatura digital da ficha médica
#     [Tags]    robot:recursive-continue-on-failure
#     Sleep    ${tempo_minimo}
#     Scroll Element Into View    ${tela_assinatura_digital.fechar}
#     Wait Until Element Is Visible    ${tela_assinatura_digital.fechar}    ${tempo_padrao}
#     Click Button    ${tela_assinatura_digital.fechar}
#     Sleep    ${tempo_minimo}
#     Scroll To Top

Recusar assinatura digital da ficha médica
    Sleep    ${tempo_minimo}
    ${botao_visivel}=    Run Keyword And Return Status    Element Should Be Visible    ${tela_assinatura_digital.fechar}    ${tempo_padrao}
    Run Keyword If    '${botao_visivel}' == 'True'
    ...    Run Keywords
    ...    Wait Until Element Is Visible    ${tela_assinatura_digital.fechar}    ${tempo_padrao}
    ...    AND    Click Button    ${tela_assinatura_digital.fechar}
    ...    AND    Sleep    ${tempo_minimo}
    ...    AND    Scroll To Top

Selecionar ficha dinâmica
    [Arguments]    ${btn_selecionar_ficha}
    Wait Until Element Is Visible    ${btn_selecionar_ficha}    ${tempo_padrao}
    Click Button    ${btn_selecionar_ficha}
    Sleep    ${tempo_minimo}

Selecionar ficha clínica estática
    [Arguments]    ${btn_selecionar_ficha}
    Wait Until Element Is Visible    ${btn_selecionar_ficha}    ${tempo_padrao}
    Click button    ${btn_selecionar_ficha}
    Sleep    ${tempo_minimo}

Preencher ficha dinamica - formulario completo obrigatórios
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_saude_geral.unidade_de_atendimento}
    Wait Until Element Is Visible    ${ficha_saude_geral.unidade_de_atendimento}    ${tempo_padrao}

    Scroll Element Into View    ${ficha_saude_geral.disponibilizar_para_paciente.sim}
    Wait Until Element Is Visible    ${ficha_saude_geral.disponibilizar_para_paciente.sim}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.disponibilizar_para_paciente.sim}

    Scroll Element Into View    ${ficha_dinamica.teste_lista}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_lista}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_lista}

    Scroll Element Into View    ${ficha_dinamica.teste_lista.item1}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_lista.item1}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_lista.item1}

    Click Element    ${ficha_dinamica.teste_lista}

    Scroll Element Into View    ${ficha_dinamica.teste_lista.item2}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_lista.item2}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_lista.item2}

    Click Element    ${ficha_dinamica.teste_lista}

    Scroll Element Into View    ${ficha_dinamica.teste_lista.item3}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_lista.item3}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_lista.item3}

    Scroll Element Into View    ${ficha_dinamica.teste_lista_opcoes1}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_lista_opcoes1}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_lista_opcoes1}

    Scroll Element Into View    ${ficha_dinamica.teste_lista_opcoes2}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_lista_opcoes2}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_lista_opcoes2}

    Scroll Element Into View    ${ficha_dinamica.teste_lista_opcoes3}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_lista_opcoes3}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_lista_opcoes3}

    Scroll Element Into View    ${ficha_dinamica.teste_item1}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_item1}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_item1}

    Scroll Element Into View    ${ficha_dinamica.teste_item2}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_item2}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_item2}

    Scroll Element Into View    ${ficha_dinamica.teste_item3}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_item3}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_item3}

    Scroll Element Into View    ${ficha_dinamica.teste_caixa_de_texto}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_caixa_de_texto}    ${tempo_padrao}
    Input Text    ${ficha_dinamica.teste_caixa_de_texto}    ${mensagem_paciente}

    Scroll Element Into View    ${ficha_dinamica.teste_area_de_texto}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_area_de_texto}    ${tempo_padrao}
    Input Text    ${ficha_dinamica.teste_area_de_texto}    ${mensagem_paciente}

    Scroll Element Into View    ${ficha_dinamica.teste_campo_de_data}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_campo_de_data}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_campo_de_data}
    Scroll Element Into View    ${ficha_dinamica.teste_campo_de_data.dia}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_campo_de_data.dia}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_campo_de_data.dia}

    Scroll Element Into View    ${ficha_dinamica.teste_campo_numerico}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_campo_numerico}    ${tempo_padrao}
    Input Text    ${ficha_dinamica.teste_campo_numerico}    ${mensagem_paciente}
    Input Text    ${ficha_dinamica.teste_campo_numerico}    ${dias}

    Scroll Element Into View    ${ficha_dinamica.teste.titulo}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_dinamica.teste.subtitulo}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_dinamica.teste.autotexto}
    Sleep    ${tempo_minimo}

    ### Upload
    Scroll Element Into View    ${ficha_dinamica.tela_anexos.botao_anexar_imagem}
    Wait Until Element Is Visible    ${ficha_dinamica.tela_anexos.botao_anexar_imagem}    ${tempo_padrao}
    Click Button    ${ficha_dinamica.tela_anexos.botao_anexar_imagem}
    Sleep    ${tempo_elemento}

    Scroll Element Into View    ${ficha_dinamica.tela_anexos.botao_capturar_imagem}
    Wait Until Element Is Enabled    ${ficha_dinamica.tela_anexos.botao_capturar_imagem}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.tela_anexos.botao_capturar_imagem}

    Scroll Element Into View    ${ficha_dinamica.tela_anexos.botao_voltar}
    Wait Until Element Is Visible    ${ficha_dinamica.tela_anexos.botao_voltar}    ${tempo_padrao}
    Click Button    ${ficha_dinamica.tela_anexos.botao_voltar}
    Sleep    ${tempo_elemento}

    ### Procedimento
    Scroll Element Into View    ${ficha_saude_geral.procedimentos_realizados}
    Wait Until Element Is Visible    ${ficha_saude_geral.procedimentos_realizados}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.procedimentos_realizados}
    Scroll Element Into View    ${ficha_saude_geral.procedimentos_realizados.itens}
    Wait Until Element Is Visible    ${ficha_saude_geral.procedimentos_realizados.itens}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Element
    ...    ${ficha_saude_geral.procedimentos_realizados.atencao_primaria}    # 0301040087 - ATENDIMENTO EM GRUPO NA ATENÇÃO PRIMÁRIA
    Click Element    ${ficha_saude_geral.procedimentos_realizados}

    ### CID e CIAP
    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.buscar_cid}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.buscar_cid}    ${tempo_padrao}
    Input Text
    ...    ${ficha_saude_geral.hipotese_diagnostica.buscar_cid}
    ...    ${ficha_saude_geral.hipotese_diagnostica.cid10.texto}
    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.buscar_cid.botao_buscar}
    Wait Until Element Is Visible
    ...    ${ficha_saude_geral.hipotese_diagnostica.buscar_cid.botao_buscar}
    ...    ${tempo_padrao}
    Click Button    ${ficha_saude_geral.hipotese_diagnostica.buscar_cid.botao_buscar}

    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.cid10}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.cid10}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.cid10}
    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.cid10.itens}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.cid10.itens}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.cid10.A90}    ### A90 - DENGUE
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.cid10.A91}    ### A91 - DENGUE
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.cid10}

    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.buscar_ciap2}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.buscar_ciap2}    ${tempo_padrao}
    Input Text
    ...    ${ficha_saude_geral.hipotese_diagnostica.buscar_ciap2}
    ...    ${ficha_saude_geral.hipotese_diagnostica.ciap2.texto}
    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.ciap2.botao_buscar}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.ciap2.botao_buscar}    ${tempo_padrao}
    Click Button    ${ficha_saude_geral.hipotese_diagnostica.ciap2.botao_buscar}
    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.ciap2}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.ciap2}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.ciap2}
    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.ciap2.itens}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.ciap2.itens}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.ciap2.A77}    ### A77 - DENGUE
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.ciap2}

    ### Adicionar Exames
    Scroll Element Into View    ${ficha_dinamica.adicionar_exames.titulo}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_dinamica.botao_adicionar_exames}
    Wait Until Element Is Visible    ${ficha_dinamica.botao_adicionar_exames}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.botao_adicionar_exames}
    Scroll Element Into View    ${ficha_dinamica.exame_realizado}
    Wait Until Element Is Visible    ${ficha_dinamica.exame_realizado}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.exame_realizado}
    Scroll Element Into View    ${ficha_dinamica.exame_realizado.exame_teste}
    Wait Until Element Is Visible    ${ficha_dinamica.exame_realizado.exame_teste}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.exame_realizado.exame_teste}
    Scroll Element Into View    ${ficha_dinamica.campo_data1}
    Wait Until Element Is Visible    ${ficha_dinamica.campo_data1}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.campo_data1}
    Scroll Element Into View    ${ficha_dinamica.campo_data1.dia1}
    Wait Until Element Is Visible    ${ficha_dinamica.campo_data1.dia1}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.campo_data1.dia1}

    ### Preencher Conduta
    Scroll Element Into View    ${ficha_saude_geral.conduta.titulo}
    
    ### Orientações
    Scroll Element Into View    ${ficha_saude_geral.conduta.orientacoes}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.orientacoes}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.orientacoes}
    Scroll Element Into View    ${ficha_dinamica.orientacoes.descreva}
    Wait Until Element Is Visible    ${ficha_dinamica.orientacoes.descreva}    ${tempo_padrao}
    Input Text    ${ficha_dinamica.orientacoes.descreva}    ${mensagem_paciente}
    Sleep    ${tempo_elemento}

    ### Prescrição de Medicamentos MEMED
    Scroll Element Into View    ${ficha_saude_geral.conduta.prescricao_medicamentos}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.prescricao_medicamentos}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.prescricao_medicamentos}
    Sleep    ${tempo_padrao}
    Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos}    ${tempo_padrao}
    Select Frame    ${ficha_saude_geral.tela.prescricao_medicamentos}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.gerar_receita}    ${tempo_padrao}
        Click Button    ${ficha_saude_geral.tela.prescricao_medicamentos.gerar_receita}

        ### Medicamento 01
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.pesquisar}    ${tempo_padrao}
        Input Text
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.pesquisar}
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.texto}
        Sleep    ${tempo_elemento}
        Scroll Element Into View    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona}
        Wait Until Element Is Visible
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.posologia}
        ...    ${tempo_padrao}
        Input Text
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.posologia}
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.texto_posologia}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.quantidade}    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.quantidade}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.uso_continuo}    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.uso_continuo}

        ### Medicamento 02
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.gerar_receita}    ${tempo_padrao}
        Click Button    ${ficha_saude_geral.tela.prescricao_medicamentos.gerar_receita}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.pesquisar}    ${tempo_padrao}
        Input text    ${ficha_saude_geral.tela.prescricao_medicamentos.pesquisar}    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.texto}
        Sleep    ${tempo_elemento}
        Scroll Element Into View    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol}    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol}
        Wait Until Element Is Visible
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.posologia}
        ...    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.posologia}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.posologia.tabela.item}
        Mouse Over    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.posologia.tabela.item}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.posologia.tabela.item}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.quantidade}    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.quantidade}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.uso_continuo}    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.uso_continuo}

        ### Prescrição de Medicamentos MEMED - Finalizar
        Scroll Element Into View    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_gerar_receita}
        Wait Until Element Is Visible
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_gerar_receita}
        ...    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_gerar_receita}
        Sleep    ${tempo_padrao}
        Wait Until Element Is Visible
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_enviar_receita}
        ...    ${tempo_padrao}
        Click Button    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_enviar_receita}

        Scroll Element Into View    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_assinar_outra_forma}
        Wait Until Element Is Visible
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_assinar_outra_forma}
        ...    ${tempo_padrao}
        Click Button    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_assinar_outra_forma}
        Sleep    ${tempo_padrao}
        ### Até aqui roda tudo certo
    Unselect Frame

    Sleep    ${tempo_elemento}
    Wait Until Element Is Visible    ${ficha_saude_geral.tela_salvar_receita}    ${tempo_padrao}
    Select Frame    ${ficha_saude_geral.tela_salvar_receita}
    Wait Until Element Is Visible    ${ficha_saude_geral.tela_salvar_receita.fechar}    ${tempo_padrao}
    Click Button    ${ficha_saude_geral.tela_salvar_receita.fechar}
    Unselect Frame

    Sleep    ${tempo_elemento}
    Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos}    ${tempo_padrao}
    Select Frame    ${ficha_saude_geral.tela.prescricao_medicamentos}
    Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.fechar}    ${tempo_padrao}
    Click Button    ${ficha_saude_geral.tela.prescricao_medicamentos.fechar}
    Unselect Frame

    Wait Until Element Is Not Visible    ${ficha_saude_geral.tela.prescricao_medicamentos}    ${tempo_padrao}
    Scroll Element Into View    ${ficha_saude_geral.conduta.receita}
    Sleep    ${tempo_minimo}

    ### Solicitação de exames
    Scroll Element Into View    ${ficha_saude_geral.conduta.exame}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.exame}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.exame}
    Scroll Element Into View    ${ficha_dinamica.exame.descreva}
    Wait Until Element Is Visible    ${ficha_dinamica.exame.descreva}    ${tempo_padrao}
    Input Text    ${ficha_dinamica.exame.descreva}    ${mensagem_paciente}
    Sleep    ${tempo_elemento}

    ### Receituário
    Scroll Element Into View    ${ficha_saude_geral.conduta.receita}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.receita}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.receita}
    Scroll Element Into View    ${ficha_dinamica.receita.descreva}
    Wait Until Element Is Visible    ${ficha_dinamica.receita.descreva}    ${tempo_padrao}
    Input Text    ${ficha_dinamica.receita.descreva}    ${mensagem_paciente}
    Sleep    ${tempo_elemento}

    ### Atestado
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.atestado}
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado.dias}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado.dias}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.conduta.atestado.dias}    ${dias}
    Sleep    ${tempo_elemento}

    ### Preencher Seguimento
    ### Matriciamento
    Scroll Element Into View    ${ficha_dinamica.matriciamento}
    Wait Until Element Is Visible    ${ficha_dinamica.matriciamento}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.matriciamento}
    Wait Until Element Is Visible
    ...    ${ficha_saude_geral.seguimento.matriciamento.grupo_de_pacientes}
    ...    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.matriciamento.grupo_de_pacientes}
    Wait Until Element Is Visible
    ...    ${ficha_saude_geral.seguimento.matriciamento.grupo_de_pacientes.padrao}
    ...    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.matriciamento.grupo_de_pacientes.padrao}
    Click Element    ${ficha_saude_geral.seguimento.matriciamento.especialidade}
    Sleep    ${tempo_elemento}
    Wait Until Element Is Visible
    ...    ${ficha_saude_geral.seguimento.matriciamento.especialidade.dentistica}
    ...    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.matriciamento.especialidade.dentistica}
    Wait Until Element Is Enabled    ${ficha_saude_geral.seguimento.matriciamento.botao_salvar}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.matriciamento.botao_salvar}
    Sleep    ${tempo_elemento}

    ### Reavaliação
    Scroll Element Into View    ${ficha_saude_geral.seguimento.reavaliacao}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.reavaliacao}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.reavaliacao}
    Scroll Element Into View    ${ficha_dinamica.campo_data2}
    Click Element    ${ficha_dinamica.campo_data2}
    Wait Until Element Is Visible    ${ficha_dinamica.campo_data2.dia2}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.campo_data2.dia2}
    Scroll Element Into View    ${ficha_saude_geral.seguimento.reavaliacao.tipo_profissional}
    Click Element    ${ficha_saude_geral.seguimento.reavaliacao.tipo_profissional}
    Scroll Element Into View    ${ficha_saude_geral.seguimento.reavaliacao.tipo_profissional.medico}
    Wait Until Element Is Visible
    ...    ${ficha_saude_geral.seguimento.reavaliacao.tipo_profissional.medico}
    ...    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.reavaliacao.tipo_profissional.medico}
    Scroll Element Into View    ${ficha_saude_geral.seguimento.reavaliacao.necessita_apoio}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.reavaliacao.necessita_apoio}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.reavaliacao.necessita_apoio}
    Sleep    ${tempo_elemento}

    ### Encaminhamento
    Scroll Element Into View    ${ficha_saude_geral.seguimento.encaminhamento}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.encaminhamento}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.encaminhamento}
    Wait Until Element Is Visible    ${ficha_dinamica.encaminhamento}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.encaminhamento}
    Sleep    ${tempo_elemento}

    ### UPA
    Scroll Element Into View    ${ficha_saude_geral.seguimento.encaminhamento_UPA}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.encaminhamento_UPA}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.encaminhamento_UPA}
    Sleep    ${tempo_elemento}

    ### Alta
    Scroll Element Into View    ${ficha_saude_geral.seguimento.alta}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.alta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.alta}
    Sleep    ${tempo_elemento}

    ### Solicitar Interconsulta
    Scroll Element Into View    ${ficha_saude_geral.botao_solicitar_interconsulta}
    Wait Until Element Is Visible    ${ficha_saude_geral.botao_solicitar_interconsulta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.botao_solicitar_interconsulta}
    Sleep    ${tempo_elemento}
    Click Button    ${ficha_dinamica.solicitar_interconsultas}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_saude_geral.solicitar_interconsulta.adicionar_especialidade}
    Wait Until Element Is Visible
    ...    ${ficha_saude_geral.solicitar_interconsulta.adicionar_especialidade}
    ...    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.solicitar_interconsulta.adicionar_especialidade}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.area}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.area}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.area}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.area.medico}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.area.medico}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.area.medico}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.especialidade}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.especialidade}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.especialidade}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.especialidade.cirurgiao_geral}
    Wait Until Element Is Visible
    ...    ${ficha_saude_geral.interconsulta.especialidade.cirurgiao_geral}
    ...    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.especialidade.cirurgiao_geral}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.classificacao}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.classificacao}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.classificacao}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.classificacao.amarelo}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.classificacao.amarelo}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.classificacao.amarelo}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.solicitacao}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.solicitacao}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.solicitacao}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.solicitacao.parecer}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.solicitacao.parecer}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.solicitacao.parecer}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.prioridade}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.prioridade}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.prioridade}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.prioridade.teste}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.prioridade.teste}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.prioridade.teste}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.descreva}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.descreva}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.interconsulta.descreva}    ${mensagem_paciente}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}
    Wait Until Element Is Enabled    ${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}
    Sleep    ${tempo_minimo}

    ### Salvar Ficha
    Scroll Element Into View    ${ficha_dinamica.botao_finalizar}
    Wait Until Element Is Visible    ${ficha_dinamica.botao_finalizar}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.botao_finalizar}

### Preenchimento de Fichas Somente para Testes de Anexo
Preencher ficha campos obrigatórios para teste de anexo - formulário completo 09/05
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_saude_geral.unidade_de_atendimento}
    Wait Until Element Is Visible    ${ficha_saude_geral.unidade_de_atendimento}    ${tempo_padrao}

    Scroll Element Into View    ${ficha_saude_geral.disponibilizar_para_paciente.sim}
    Wait Until Element Is Visible    ${ficha_saude_geral.disponibilizar_para_paciente.sim}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.disponibilizar_para_paciente.sim}

    ### Atestado
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.atestado}
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado.dias}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado.dias}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.conduta.atestado.dias}    ${dias}
    
    ### Alta
    Scroll Element Into View    ${ficha_saude_geral.seguimento.alta}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.alta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.alta}
    Sleep    ${tempo_minimo}

Preencher ficha campos obrigatórios para teste de anexo - formulário composto 09/05
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_saude_geral.unidade_de_atendimento}
    Wait Until Element Is Visible    ${ficha_saude_geral.unidade_de_atendimento}    ${tempo_padrao}

    Scroll Element Into View    ${ficha_saude_geral.disponibilizar_para_paciente.sim}
    Wait Until Element Is Visible    ${ficha_saude_geral.disponibilizar_para_paciente.sim}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.disponibilizar_para_paciente.sim}

    ### Atestado
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.atestado}
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado.dias}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado.dias}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.conduta.atestado.dias}    ${dias}
    
    ### Alta
    Scroll Element Into View    ${ficha_saude_geral.seguimento.alta}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.alta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.alta}
    Sleep    ${tempo_minimo}

Preencher ficha campos obrigatórios para teste de anexo - formulário completo obrigatorios
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_saude_geral.unidade_de_atendimento}
    Wait Until Element Is Visible    ${ficha_saude_geral.unidade_de_atendimento}    ${tempo_padrao}

    Scroll Element Into View    ${ficha_saude_geral.disponibilizar_para_paciente.sim}
    Wait Until Element Is Visible    ${ficha_saude_geral.disponibilizar_para_paciente.sim}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.disponibilizar_para_paciente.sim}

    Scroll Element Into View    ${ficha_dinamica.teste_lista}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_lista}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_lista}
    Scroll Element Into View    ${ficha_dinamica.teste_lista.item1}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_lista.item1}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_lista.item1}

    Scroll Element Into View    ${ficha_dinamica.teste_lista_opcoes1}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_lista_opcoes1}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_lista_opcoes1}

    Scroll Element Into View    ${ficha_dinamica.teste_item1}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_item1}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_item1}

    Scroll Element Into View    ${ficha_dinamica.teste_caixa_de_texto}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_caixa_de_texto}    ${tempo_padrao}
    Input Text    ${ficha_dinamica.teste_caixa_de_texto}    ${mensagem_paciente}

    Scroll Element Into View    ${ficha_dinamica.teste_area_de_texto}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_area_de_texto}    ${tempo_padrao}
    Input Text    ${ficha_dinamica.teste_area_de_texto}    ${mensagem_paciente}

    Scroll Element Into View    ${ficha_dinamica.teste_campo_de_data}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_campo_de_data}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_campo_de_data}
    Scroll Element Into View    ${ficha_dinamica.teste_campo_de_data.dia}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_campo_de_data.dia}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.teste_campo_de_data.dia}

    Scroll Element Into View    ${ficha_dinamica.teste_campo_numerico}
    Wait Until Element Is Visible    ${ficha_dinamica.teste_campo_numerico}    ${tempo_padrao}
    Input Text    ${ficha_dinamica.teste_campo_numerico}    ${dias}

    ### Atestado
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.atestado}
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado.dias}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado.dias}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.conduta.atestado.dias}    ${dias}

    ### Alta
    Scroll Element Into View    ${ficha_saude_geral.seguimento.alta}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.alta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.alta}
    Sleep    ${tempo_minimo}

Preencher ficha campos obrigatórios para teste de anexo - triagem
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_saude_geral.unidade_de_atendimento}
    Wait Until Element Is Visible    ${ficha_saude_geral.unidade_de_atendimento}    ${tempo_padrao}

    Scroll Element Into View    ${ficha_saude_geral.disponibilizar_para_paciente.sim}
    Wait Until Element Is Visible    ${ficha_saude_geral.disponibilizar_para_paciente.sim}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.disponibilizar_para_paciente.sim}

    ### Upload
    Scroll Element Into View    ${ficha_dinamica.tela_anexos.anexar_exames}
    Wait Until Element Is Visible    ${ficha_dinamica.tela_anexos.anexar_exames}    ${tempo_padrao}
    Click Button    ${ficha_dinamica.tela_anexos.anexar_exames}
    Sleep    ${tempo_elemento}

    Choose File    ${tela_anexos.selecionar_arquivo}    ${tela_anexos.arquivo_carregado}
    Wait Until Page Contains    img-teste.jpg    ${tempo_maximo}

    Wait Until Element Is Enabled    ${tela_anexos.botao_carregar_todos}    ${tempo_padrao}
    Click Button    ${tela_anexos.botao_carregar_todos}

    Scroll Element Into View    ${tela_anexos.botao_voltar}
    Wait Until Element Is Visible    ${tela_anexos.botao_voltar}    ${tempo_padrao}
    Click Button    ${tela_anexos.botao_voltar}
    Sleep    ${tempo_minimo}

    ### Atestado
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.atestado}
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado.dias}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado.dias}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.conduta.atestado.dias}    ${dias}
    
    ### Alta
    Scroll Element Into View    ${ficha_saude_geral.seguimento.alta}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.alta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.alta}
    Sleep    ${tempo_minimo}

Finalizar fichas dinâmicas
    Scroll Element Into View    ${ficha_dinamica.botao_concluido}
    Wait Until Element Is Visible    ${ficha_dinamica.botao_concluido}    ${tempo_padrao}
    Click Element    ${ficha_dinamica.botao_concluido}
    
Realizar anexos prontuário paciente
    Sleep    ${tempo_maximo}
    Scroll Element Into View    ${prontuario_do_paciente.botao_anexos}
    Wait Until Element Is Visible    ${prontuario_do_paciente.botao_anexos}    ${tempo_maximo}
    Click Button    ${prontuario_do_paciente.botao_anexos}
    Sleep    ${tempo_minimo}
    
    ### Carregar anexos individuais
    Loader Individual Image    ${prontuario_do_paciente.tela_anexos.selecionar_arquivo}
    ...    ${prontuario_do_paciente.tela_anexos.nome_arquivo_carregado}
    ...    ${prontuario_do_paciente.tela_anexos.carregar_arquivo}
    ...    ${arquivo_anexo.catapora-anexo}    catapora-anexo.jpg
    
    Loader Individual Image    ${prontuario_do_paciente.tela_anexos.selecionar_arquivo}
    ...    ${prontuario_do_paciente.tela_anexos.nome_arquivo_carregado}
    ...    ${prontuario_do_paciente.tela_anexos.carregar_arquivo}
    ...    ${arquivo_anexo.dente-cariado-anexo}    dente-cariado-anexo.jpg
    
    Loader Individual Image    ${prontuario_do_paciente.tela_anexos.selecionar_arquivo}
    ...    ${prontuario_do_paciente.tela_anexos.nome_arquivo_carregado}
    ...    ${prontuario_do_paciente.tela_anexos.carregar_arquivo}
    ...    ${arquivo_anexo.gastrite-anexo}    gastrite-anexo.png
    
    Loader Individual Image    ${prontuario_do_paciente.tela_anexos.selecionar_arquivo}
    ...    ${prontuario_do_paciente.tela_anexos.nome_arquivo_carregado}
    ...    ${prontuario_do_paciente.tela_anexos.carregar_arquivo}
    ...    ${arquivo_anexo.hemograma-anexo}    hemograma-anexo.png
    
    Loader Individual Image    ${prontuario_do_paciente.tela_anexos.selecionar_arquivo}
    ...    ${prontuario_do_paciente.tela_anexos.nome_arquivo_carregado}
    ...    ${prontuario_do_paciente.tela_anexos.carregar_arquivo}
    ...    ${arquivo_anexo.psoriase_anexo}    psoriase-anexo.jpg
    
    Loader Individual Image    ${prontuario_do_paciente.tela_anexos.selecionar_arquivo}
    ...    ${prontuario_do_paciente.tela_anexos.nome_arquivo_carregado}
    ...    ${prontuario_do_paciente.tela_anexos.carregar_arquivo}
    ...    ${arquivo_anexo.raio-x-anexo}    raio-x-anexo.png

    ### finalizar carregamento de anexos
    Scroll Element Into View    ${prontuario_do_paciente.tela_anexos.botao_fechar}
    Wait Until Element Is Visible    ${prontuario_do_paciente.tela_anexos.botao_fechar}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Button    ${prontuario_do_paciente.tela_anexos.botao_fechar}
    Sleep    ${tempo_elemento}
    Scroll To Top

Realizar anexos em lote prontuário paciente
    Sleep    ${tempo_minimo}
    ${botao_visivel}=    Run Keyword And Return Status    Element Should Be Visible    ${prontuario_do_paciente.botao_anexos}    ${tempo_minimo}
    Run Keyword If    '${botao_visivel}' == 'True'
    ...    Run Keywords
    ...    Scroll Element Into View    ${prontuario_do_paciente.botao_anexos}
    ...    AND    Wait Until Element Is Visible    ${prontuario_do_paciente.botao_anexos}    ${tempo_maximo}
    ...    AND    Click Button    ${prontuario_do_paciente.botao_anexos}
    ...    AND    Sleep    ${tempo_minimo}
    
    ### Carregar lote de anexos
    Loader Lot of Images  ${prontuario_do_paciente.tela_anexos.selecionar_arquivo}
    ...    ${prontuario_do_paciente.tela_anexos.nome_arquivo_carregado}
    ...    ${arquivo_anexo.catapora-anexo}    ${arquivo_anexo.dente-cariado-anexo}
    ...    ${arquivo_anexo.gastrite-anexo}    ${arquivo_anexo.hemograma-anexo}
    ...    ${arquivo_anexo.psoriase_anexo}    ${arquivo_anexo.raio-x-anexo}
    ...    catapora-anexo.jpg    dente-cariado-anexo.jpg    gastrite-anexo.png
    ...    hemograma-anexo.png    psoriase-anexo.jpg    raio-x-anexo.png

    Wait Until Element Is Enabled    ${prontuario_do_paciente.tela_anexos.carregar_arquivo}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Button    ${prontuario_do_paciente.tela_anexos.carregar_arquivo}
    Sleep    ${tempo_elemento}
    Wait Until Page Contains    100%    ${tempo_maximo}
    
    ### finalizar carregamento de anexos
    Scroll Element Into View    ${prontuario_do_paciente.tela_anexos.botao_fechar}
    Wait Until Element Is Visible    ${prontuario_do_paciente.tela_anexos.botao_fechar}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Button    ${prontuario_do_paciente.tela_anexos.botao_fechar}
    Sleep    ${tempo_elemento}
    Scroll To Top

Realizar lote de anexos solicitar interconsulta
    ### Carregar lote de anexos individualmente
    Loader Lot of Individual Images  ${tela_anexos.selecionar_arquivo}    
    ...    ${arquivo_anexo.catapora-anexo}    ${arquivo_anexo.dente-cariado-anexo}
    ...    ${arquivo_anexo.gastrite-anexo}    ${arquivo_anexo.hemograma-anexo}
    ...    ${arquivo_anexo.psoriase_anexo}    ${arquivo_anexo.raio-x-anexo}
    ...    catapora-anexo.jpg    dente-cariado-anexo.jpg    gastrite-anexo.png
    ...    hemograma-anexo.png    psoriase-anexo.jpg    raio-x-anexo.png

    Sleep    ${tempo_minimo}
    Wait Until Element Is Enabled    ${tela_anexos.botao_carregar_todos}    ${tempo_padrao}
    Click Button    ${tela_anexos.botao_carregar_todos}

    Scroll Element Into View    ${tela_anexos.botao_voltar}
    Wait Until Element Is Visible    ${tela_anexos.botao_voltar}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Button    ${tela_anexos.botao_voltar}
    Sleep    ${tempo_minimo}

Realizar anexo ficha clínica
    Scroll Element Into View    ${tela_anexos.botao_anexar_imagens}    ### //*[@for="uploadFile"]
    Wait Until Element Is Visible    ${tela_anexos.botao_anexar_imagens}    ${tempo_maximo}
    Click Button    ${tela_anexos.botao_anexar_imagens}
    Sleep    ${tempo_elemento}

    ### Carregar lote de anexos individualmente
    Loader Lot of Individual Images  ${tela_anexos.selecionar_arquivo}    
    ...    ${arquivo_anexo.catapora-anexo}    ${arquivo_anexo.dente-cariado-anexo}
    ...    ${arquivo_anexo.gastrite-anexo}    ${arquivo_anexo.hemograma-anexo}
    ...    ${arquivo_anexo.psoriase_anexo}    ${arquivo_anexo.raio-x-anexo}
    ...    catapora-anexo.jpg    dente-cariado-anexo.jpg    gastrite-anexo.png
    ...    hemograma-anexo.png    psoriase-anexo.jpg    raio-x-anexo.png

    Sleep    ${tempo_minimo}
    Wait Until Element Is Enabled    ${tela_anexos.botao_carregar_todos}    ${tempo_padrao}
    Click Button    ${tela_anexos.botao_carregar_todos}

    Scroll Element Into View    ${tela_anexos.botao_voltar}
    Wait Until Element Is Visible    ${tela_anexos.botao_voltar}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Button    ${tela_anexos.botao_voltar}
    Sleep    ${tempo_minimo}

Realizar anexo ficha dinâmica
    Scroll Element Into View    ${ficha_dinamica.tela_anexos.botao_anexar_imagem}
    Wait Until Element Is Visible    ${ficha_dinamica.tela_anexos.botao_anexar_imagem}    ${tempo_padrao}
    Click Button    ${ficha_dinamica.tela_anexos.botao_anexar_imagem}
    Sleep    ${tempo_minimo}

    Choose File    ${tela_anexos.selecionar_arquivo}    ${tela_anexos.arquivo_carregado}
    Wait Until Page Contains    img-teste.jpg    ${tempo_maximo}

    Wait Until Element Is Enabled    ${tela_anexos.botao_carregar_todos}    ${tempo_padrao}
    Click Button    ${tela_anexos.botao_carregar_todos}

    Scroll Element Into View    ${tela_anexos.botao_voltar}
    Wait Until Element Is Visible    ${tela_anexos.botao_voltar}    ${tempo_padrao}
    Click Button    ${tela_anexos.botao_voltar}
    Sleep    ${tempo_minimo}

Preencher ficha clínica geral - campos obrigatórios
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_saude_geral.unidade_de_atendimento}
    Wait Until Element Is Visible    ${ficha_saude_geral.unidade_de_atendimento}    ${tempo_padrao}
    Scroll Element Into View    ${ficha_saude_geral.disponibilizar_para_paciente.sim}
    Wait Until Element Is Visible    ${ficha_saude_geral.disponibilizar_para_paciente.sim}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.disponibilizar_para_paciente.sim}
    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}
    Wait Until Element Is Visible
    ...    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}
    ...    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}
    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.itens}
    Wait Until Element Is Visible
    ...    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.itens}
    ...    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.sintomas_ortopedicos}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}
    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}
    Input Text    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}    ${mensagem_paciente}
    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas}
    Input Text    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas}    ${dias}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas.data}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas.dia}
    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.duracao_outros}
    Input text
    ...    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.duracao_outros}
    ...    ${mensagem_paciente}
    Scroll Element Into View    ${ficha_saude_geral.procedimentos_realizados}
    Wait Until Element Is Visible    ${ficha_saude_geral.procedimentos_realizados}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.procedimentos_realizados}
    Scroll Element Into View    ${ficha_saude_geral.procedimentos_realizados.itens}
    Wait Until Element Is Visible    ${ficha_saude_geral.procedimentos_realizados.itens}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Element    ${ficha_saude_geral.procedimentos_realizados.atencao_primaria}     # 0301040087 - ATENDIMENTO EM GRUPO NA ATENÇÃO PRIMÁRIA
    Click Element    ${ficha_saude_geral.procedimentos_realizados}
    Scroll Element Into View    ${ficha_saude_geral.conduta.titulo}

    ### Atestado
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.atestado}
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado.dias}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado.dias}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.conduta.atestado.dias}    ${dias}

    ### Alta
    Scroll Element Into View    ${ficha_saude_geral.seguimento.alta}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.alta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.alta}

Concluir atendimento e fechar ficha
    Scroll Element Into View    ${ficha_saude_geral.botao_concluir}
    Wait Until Element Is Visible    ${ficha_saude_geral.botao_concluir}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Element    ${ficha_saude_geral.botao_concluir}

Preencher ficha clínica - saúde geral todos os campos
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_saude_geral.unidade_de_atendimento}
    Wait Until Element Is Visible    ${ficha_saude_geral.unidade_de_atendimento}    ${tempo_padrao}

    Scroll Element Into View    ${ficha_saude_geral.disponibilizar_para_paciente.sim}
    Wait Until Element Is Visible    ${ficha_saude_geral.disponibilizar_para_paciente.sim}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.disponibilizar_para_paciente.sim}

    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}
    Wait Until Element Is Visible    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}
    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.itens}
    Wait Until Element Is Visible    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.itens}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.sintomas_ortopedicos}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}

    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}
    Input Text    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}    ${mensagem_paciente}

    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas}
    Input Text    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas}    ${dias}

    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.duracao_outros}
    Input Text    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.duracao_outros}    ${mensagem_paciente}

    Scroll Element Into View    ${ficha_saude_geral.hpma.descreva}
    Input Text    ${ficha_saude_geral.hpma.descreva}    ${mensagem_paciente}

    Scroll Element Into View    ${ficha_saude_geral.exame_fisico.descreva}
    Input Text    ${ficha_saude_geral.exame_fisico.descreva}    ${mensagem_paciente}

    Scroll Element Into View    ${ficha_saude_geral.sinais_vitais.pa}
    Wait Until Element Is Visible    ${ficha_saude_geral.sinais_vitais.pa}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.sinais_vitais.pa}    ${valor}
    Input Text    ${ficha_saude_geral.sinais_vitais.temperatura}    ${valor}
    Input Text    ${ficha_saude_geral.sinais_vitais.fc}    ${valor}
    Input Text    ${ficha_saude_geral.sinais_vitais.fr}    ${valor}
    Input Text    ${ficha_saude_geral.sinais_vitais.oximetria}    ${valor}
    Input Text    ${ficha_saude_geral.sinais_vitais.glicemia}    ${valor}
    Sleep    ${tempo_minimo}

    Scroll Element Into View    ${ficha_saude_geral.procedimentos_realizados}
    Wait Until Element Is Visible    ${ficha_saude_geral.procedimentos_realizados}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.procedimentos_realizados}
    Scroll Element Into View    ${ficha_saude_geral.procedimentos_realizados.itens}
    Wait Until Element Is Visible    ${ficha_saude_geral.procedimentos_realizados.itens}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Element    ${ficha_saude_geral.procedimentos_realizados.atencao_primaria}    ### 0301040087 - ATENDIMENTO EM GRUPO NA ATENÇÃO PRIMÁRIA
    Click Element    ${ficha_saude_geral.procedimentos_realizados}

    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.buscar_cid}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.buscar_cid}    ${tempo_padrao}
    Input text    ${ficha_saude_geral.hipotese_diagnostica.buscar_cid}    ${ficha_saude_geral.hipotese_diagnostica.cid10.texto}
    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.buscar_cid.botao_buscar}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.buscar_cid.botao_buscar}    ${tempo_padrao}
    Click Button    ${ficha_saude_geral.hipotese_diagnostica.buscar_cid.botao_buscar}

    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.cid10}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.cid10}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.cid10}
    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.cid10.itens}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.cid10.itens}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.cid10.A90}    ### A90 - DENGUE
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.cid10.A91}    ### A91 - DENGUE
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.cid10}

    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.buscar_ciap2}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.buscar_ciap2}    ${tempo_padrao}
    Input text    ${ficha_saude_geral.hipotese_diagnostica.buscar_ciap2}    ${ficha_saude_geral.hipotese_diagnostica.ciap2.texto}
    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.ciap2.botao_buscar}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.ciap2.botao_buscar}    ${tempo_padrao}
    Click Button    ${ficha_saude_geral.hipotese_diagnostica.ciap2.botao_buscar}
    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.ciap2}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.ciap2}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.ciap2}
    Scroll Element Into View    ${ficha_saude_geral.hipotese_diagnostica.ciap2.itens}
    Wait Until Element Is Visible    ${ficha_saude_geral.hipotese_diagnostica.ciap2.itens}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.ciap2.A77}    # A77 - DENGUE
    Click Element    ${ficha_saude_geral.hipotese_diagnostica.ciap2}

    Scroll Element Into View    ${ficha_saude_geral.conduta.titulo}

    ### Orientações
    Scroll Element Into View    ${ficha_saude_geral.conduta.orientacoes}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.orientacoes}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.orientacoes}
    Scroll Element Into View    ${ficha_saude_geral.conduta.orientacoes.descreva}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.orientacoes.descreva}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.conduta.orientacoes.descreva}    ${mensagem_paciente}
    Sleep    ${tempo_elemento}

    ### Prescrição de Medicamentos MEMED
    Scroll Element Into View    ${ficha_saude_geral.conduta.prescricao_medicamentos}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.prescricao_medicamentos}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.prescricao_medicamentos}
    Sleep    ${tempo_padrao}
    Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos}    ${tempo_padrao}
    Select Frame    ${ficha_saude_geral.tela.prescricao_medicamentos}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.gerar_receita}    ${tempo_padrao}

        Run Keyword And Ignore Error    Wait Until Element Is Visible    //*[@id="temporary-announcement-close-button"]    ${tempo_padrao}
        Run Keyword And Ignore Error    Scroll Element Into View    //*[@id="temporary-announcement-close-button"]
        Run Keyword And Ignore Error    Click Element    //*[@id="temporary-announcement-close-button"]

        Click Button    ${ficha_saude_geral.tela.prescricao_medicamentos.gerar_receita}

        ### Medicamento 01
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.pesquisar}    ${tempo_padrao}
        Input Text
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.pesquisar}
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.texto}
        Sleep    ${tempo_elemento}
        Scroll Element Into View    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona}
        Wait Until Element Is Visible
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.posologia}
        ...    ${tempo_padrao}
        Input Text
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.posologia}
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.texto_posologia}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.quantidade}    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.quantidade}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.uso_continuo}    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.dipirona.uso_continuo}

        ### Medicamento 02
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.gerar_receita}    ${tempo_padrao}
        Click Button    ${ficha_saude_geral.tela.prescricao_medicamentos.gerar_receita}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.pesquisar}    ${tempo_padrao}
        Input text    ${ficha_saude_geral.tela.prescricao_medicamentos.pesquisar}    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.texto}
        Sleep    ${tempo_elemento}
        Scroll Element Into View    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol}    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol}
        Wait Until Element Is Visible
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.posologia}
        ...    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.posologia}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.posologia.tabela.item}    ${tempo_padrao}
        Mouse Over    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.posologia.tabela.item}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.posologia.tabela.item}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.quantidade}    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.quantidade}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.uso_continuo}    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.paracetamol.uso_continuo}

        ### Prescrição de Medicamentos MEMED - Finalizar
        Scroll Element Into View    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_gerar_receita}
        Wait Until Element Is Visible
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_gerar_receita}
        ...    ${tempo_padrao}
        Click Element    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_gerar_receita}
        Sleep    ${tempo_padrao}
        Wait Until Element Is Visible
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_enviar_receita}
        ...    ${tempo_padrao}
        Click Button    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_enviar_receita}

        Scroll Element Into View    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_assinar_outra_forma}
        Wait Until Element Is Visible
        ...    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_assinar_outra_forma}
        ...    ${tempo_padrao}
        Click Button    ${ficha_saude_geral.tela.prescricao_medicamentos.botao_assinar_outra_forma}
        Sleep    ${tempo_padrao}
    Unselect Frame

    Sleep    ${tempo_elemento}
    Wait Until Element Is Visible    ${ficha_saude_geral.tela_salvar_receita}    ${tempo_padrao}
    Select Frame    ${ficha_saude_geral.tela_salvar_receita}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela_salvar_receita.fechar}    ${tempo_padrao}
        Click Button    ${ficha_saude_geral.tela_salvar_receita.fechar}
    Unselect Frame

    Sleep    ${tempo_elemento}
    Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos}    ${tempo_padrao}
    Select Frame    ${ficha_saude_geral.tela.prescricao_medicamentos}
        Wait Until Element Is Visible    ${ficha_saude_geral.tela.prescricao_medicamentos.fechar}    ${tempo_padrao}
        Click Button    ${ficha_saude_geral.tela.prescricao_medicamentos.fechar}
    Unselect Frame

    Wait Until Element Is Not Visible    ${ficha_saude_geral.tela.prescricao_medicamentos}    ${tempo_padrao}
    Scroll Element Into View    ${ficha_saude_geral.conduta.receita}
    Sleep    ${tempo_minimo}

    ### Solicitação de exames
    Scroll Element Into View    ${ficha_saude_geral.conduta.exame}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.exame}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.exame}
    Scroll Element Into View    ${ficha_saude_geral.conduta.exame.descreva}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.exame.descreva}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.conduta.exame.descreva}    ${mensagem_paciente}
    # ... Checkbox Should Be Selected    ${ficha_saude_geral.conduta.receita}
    Sleep    ${tempo_minimo}

    ### Atestado
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.atestado}
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado.dias}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado.dias}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.conduta.atestado.dias}    ${dias}
    Sleep    ${tempo_minimo}

    # ### Matriciamento
    Scroll Element Into View    ${ficha_saude_geral.seguimento.solicitar_matriciamento}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.solicitar_matriciamento}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.solicitar_matriciamento}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.matriciamento.grupo_de_pacientes}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.matriciamento.grupo_de_pacientes}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.matriciamento.grupo_de_pacientes.padrao}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.matriciamento.grupo_de_pacientes.padrao}
    Click Element    ${ficha_saude_geral.seguimento.matriciamento.especialidade}
    Sleep    ${tempo_minimo}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.matriciamento.especialidade.dentistica}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.matriciamento.especialidade.dentistica}
    Wait Until Element Is Enabled    ${ficha_saude_geral.seguimento.matriciamento.botao_salvar}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.matriciamento.botao_salvar}

    ### Reavaliação
    Scroll Element Into View    ${ficha_saude_geral.seguimento.reavaliacao}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.reavaliacao}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.reavaliacao}
    Scroll Element Into View    ${ficha_saude_geral.seguimento.reavaliacao.selecione_data}
    Click Element    ${ficha_saude_geral.seguimento.reavaliacao.selecione_data}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.reavaliacao.dia}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.reavaliacao.dia}
    Scroll Element Into View    ${ficha_saude_geral.seguimento.reavaliacao.tipo_profissional}
    Click Element    ${ficha_saude_geral.seguimento.reavaliacao.tipo_profissional}
    Scroll Element Into View    ${ficha_saude_geral.seguimento.reavaliacao.tipo_profissional.medico}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.reavaliacao.tipo_profissional.medico}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.reavaliacao.tipo_profissional.medico}
    Scroll Element Into View    ${ficha_saude_geral.seguimento.reavaliacao.necessita_apoio}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.reavaliacao.necessita_apoio}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.reavaliacao.necessita_apoio}
    Sleep    ${tempo_elemento}

    ### Encaminhamento
    Scroll Element Into View    ${ficha_saude_geral.seguimento.encaminhamento}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.encaminhamento}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.encaminhamento}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.encaminhamento.online}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.encaminhamento.online}
    Sleep    ${tempo_elemento}

    ### UPA
    Scroll Element Into View    ${ficha_saude_geral.seguimento.encaminhamento_UPA}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.encaminhamento_UPA}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.encaminhamento_UPA}
    Sleep    ${tempo_elemento}

    ### Alta
    Scroll Element Into View    ${ficha_saude_geral.seguimento.alta}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.alta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.alta}
    Sleep    ${tempo_elemento}

    ### Upload
    Scroll Element Into View    ${tela_anexos.botao_anexar_imagens}    ### //*[@for="uploadFile"]
    Wait Until Element Is Visible    ${tela_anexos.botao_anexar_imagens}    ${tempo_maximo}
    Click Button    ${tela_anexos.botao_anexar_imagens}
    Sleep    ${tempo_minimo}

    Choose File    ${tela_anexos.selecionar_arquivo}    ${tela_anexos.arquivo_carregado}
    Wait Until Page Contains    img-teste.jpg    ${tempo_maximo}

    Wait Until Element Is Enabled    ${tela_anexos.botao_carregar_todos}    ${tempo_padrao}
    Click Button    ${tela_anexos.botao_carregar_todos}

    Scroll Element Into View    ${tela_anexos.botao_voltar}
    Wait Until Element Is Visible    ${tela_anexos.botao_voltar}    ${tempo_padrao}
    Click Button    ${tela_anexos.botao_voltar}
    Sleep    ${tempo_minimo}

    ### Upload
    # Scroll Element Into View    ${tela_anexos.botao_anexar_imagens}    ### //*[@for="uploadFile"]
    # Wait Until Element Is Visible    ${tela_anexos.botao_anexar_imagens}    ${tempo_maximo}
    # Click Button    ${tela_anexos.botao_anexar_imagens}
    # Sleep    ${tempo_padrao}

    # Choose File    ${tela_anexos.selecionar_arquivo}    ${tela_anexos.arquivo_carregado}
    # Wait Until Page Contains    img-teste.jpg    ${tempo_maximo}

    # Wait Until Element Is Enabled    ${tela_anexos.botao_carregar_todos}    ${tempo_padrao}
    # Sleep    ${tempo_minimo}
    # Click Button    ${tela_anexos.botao_carregar_todos}
    # Sleep    ${tempo_elemento}

    # Scroll Element Into View    ${tela_anexos.botao_voltar}
    # Wait Until Element Is Visible    ${tela_anexos.botao_voltar}    ${tempo_padrao}
    # Click Button    ${tela_anexos.botao_voltar}
    # Sleep    ${tempo_elemento}

    ### Solicitar Interconsulta ###
    Scroll Element Into View    ${ficha_saude_geral.botao_solicitar_interconsulta}
    Wait Until Element Is Visible    ${ficha_saude_geral.botao_solicitar_interconsulta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.botao_solicitar_interconsulta}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_saude_geral.solicitar_interconsulta.adicionar_especialidade}
    Wait Until Element Is Visible    ${ficha_saude_geral.solicitar_interconsulta.adicionar_especialidade}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.solicitar_interconsulta.adicionar_especialidade}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.area}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.area}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.area}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.area.medico}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.area.medico}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.area.medico}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.especialidade}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.especialidade}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.especialidade}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.especialidade.cirurgiao_geral}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.especialidade.cirurgiao_geral}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.especialidade.cirurgiao_geral}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.classificacao}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.classificacao}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.classificacao}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.classificacao.amarelo}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.classificacao.amarelo}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.classificacao.amarelo}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.solicitacao}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.solicitacao}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.solicitacao}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.solicitacao.parecer}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.solicitacao.parecer}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.solicitacao.parecer}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.prioridade}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.prioridade}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.prioridade}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.prioridade.teste}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.prioridade.teste}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.prioridade.teste}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.descreva}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.descreva}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.interconsulta.descreva}    ${mensagem_paciente}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}
    Wait Until Element Is Enabled    ${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}
    Sleep    ${tempo_minimo}
    # Scroll Element Into View    ${ficha_saude_geral.botao_concluir}
    # Wait Until Element Is Visible    ${ficha_saude_geral.botao_concluir}    ${tempo_padrao}
    # Click Element    ${ficha_saude_geral.botao_concluir}

Preencher box de pesquisa de consulta
    Wait Until Element Is Visible    ${tela_pesquisa.titulo}    ${tempo_padrao}
    Scroll Element Into View    ${tela_pesquisa.subtitulo}
    Wait Until Element Is Visible    ${tela_pesquisa.subtitulo}    ${tempo_padrao}

    Scroll Element Into View    ${tela_pesquisa.atendimento_completo.sim}
    Click Element    ${tela_pesquisa.atendimento_completo.sim}

    Scroll Element Into View    ${tela_pesquisa.atendimento_plataforma.sim}
    Click Element    ${tela_pesquisa.atendimento_plataforma.sim}

    Scroll Element Into View    ${tela_pesquisa.pronto_atendimento.sim}
    Click Element    ${tela_pesquisa.pronto_atendimento.sim}

    Scroll Element Into View    ${tela_pesquisa.atendimento_infraestrutura.sim}
    Click Element    ${tela_pesquisa.atendimento_infraestrutura.sim}

    Scroll Element Into View    ${tela_pesquisa.resolvido.sim}
    Click Element    ${tela_pesquisa.resolvido.sim}

    Scroll Element Into View    ${tela_pesquisa.satisfacao.sim}
    Click Element    ${tela_pesquisa.satisfacao.sim}

    Scroll Element Into View    ${tela_pesquisa.satisfacao.comentarios}
    Wait Until Element Is Visible    ${tela_pesquisa.satisfacao.comentarios}    ${tempo_padrao}
    Input Text    ${tela_pesquisa.satisfacao.comentarios}    ${mensagem_paciente}

    Scroll Element Into View    ${tela_pesquisa.botao_finalizar_e_salvar}
    Wait Until Element Is Visible    ${tela_pesquisa.botao_finalizar_e_salvar}    ${tempo_padrao}
    Click Button    ${tela_pesquisa.botao_finalizar_e_salvar}

Fechar box de pesquisa de consulta
    Scroll Element Into View    ${tela_pesquisa.botao_finalizar_e_salvar}
    Wait Until Element Is Visible    ${tela_pesquisa.botao_finalizar_e_salvar}    ${tempo_padrao}
    Click Button    ${tela_pesquisa.botao_finalizar_e_salvar}

### Preenchimento de Fichas Somente para Testes de Anexo ###
Preencher ficha campos obrigatórios para teste de anexo - saúde geral
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_saude_geral.unidade_de_atendimento}
    Wait Until Element Is Visible    ${ficha_saude_geral.unidade_de_atendimento}    ${tempo_padrao}
    Scroll Element Into View    ${ficha_saude_geral.disponibilizar_para_paciente.sim}
    Wait Until Element Is Visible    ${ficha_saude_geral.disponibilizar_para_paciente.sim}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.disponibilizar_para_paciente.sim}
    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}
    Wait Until Element Is Visible    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}
    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.itens}
    Wait Until Element Is Visible    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.itens}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.sintomas_ortopedicos}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas}
    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}
    Input Text    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}    ${mensagem_paciente}
    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas}
    Input Text    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas}    ${dias}
    # Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas.data}
    # Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.inicio_dos_sintomas.dia}

    ### Atestado ###
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.atestado}
    Scroll Element Into View    ${ficha_saude_geral.conduta.atestado.dias}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.atestado.dias}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.conduta.atestado.dias}    ${dias}

    ### Alta ###
    Scroll Element Into View    ${ficha_saude_geral.seguimento.alta}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.alta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.alta}

Preencher ficha campos obrigatórios para teste de anexo - psicologia
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_psicologia.dados_da_consulta.historico_do_paciente}
    Wait Until Element Is Visible    ${ficha_psicologia.dados_da_consulta.historico_do_paciente}    ${tempo_padrao}
    Input Text    ${ficha_psicologia.dados_da_consulta.historico_do_paciente}    ${mensagem_paciente}
    Scroll Element Into View    ${ficha_psicologia.dados_da_consulta.queixa_da_sessao}
    Wait Until Element Is Visible    ${ficha_psicologia.dados_da_consulta.queixa_da_sessao}    ${tempo_padrao}
    Click Element    ${ficha_psicologia.dados_da_consulta.queixa_da_sessao}
    Scroll Element Into View    ${ficha_psicologia.dados_da_consulta.queixa_da_sessao.ansiedade}
    Wait Until Element Is Visible    ${ficha_psicologia.dados_da_consulta.queixa_da_sessao.ansiedade}    ${tempo_padrao}
    Click Element    ${ficha_psicologia.dados_da_consulta.queixa_da_sessao.ansiedade}
    Click Element    ${ficha_psicologia.dados_da_consulta.queixa_da_sessao}
    Scroll Element Into View    ${ficha_psicologia.dados_da_consulta.hipotese_diagnostica}
    Wait Until Element Is Visible    ${ficha_psicologia.dados_da_consulta.hipotese_diagnostica}    ${tempo_padrao}
    Click Element    ${ficha_psicologia.dados_da_consulta.hipotese_diagnostica}
    Scroll Element Into View    ${ficha_psicologia.dados_da_consulta.hipotese_diagnostica.estresse}
    Wait Until Element Is Visible    ${ficha_psicologia.dados_da_consulta.hipotese_diagnostica.estresse}    ${tempo_padrao}
    Click Element    ${ficha_psicologia.dados_da_consulta.hipotese_diagnostica.estresse}
    Click Element    ${ficha_psicologia.dados_da_consulta.hipotese_diagnostica}
    Scroll Element Into View    ${ficha_psicologia.evolucao}
    Wait Until Element Is Visible    ${ficha_psicologia.evolucao}    ${tempo_padrao}
    Click Element    ${ficha_psicologia.evolucao}
    Scroll Element Into View    ${ficha_psicologia.evolucao.sem_mudança}
    Wait Until Element Is Visible    ${ficha_psicologia.evolucao.sem_mudança}    ${tempo_padrao}
    Click Element    ${ficha_psicologia.evolucao.sem_mudança}
    Click Element    ${ficha_psicologia.evolucao}

    ### Orientações ###
    Scroll Element Into View    ${ficha_saude_geral.conduta.orientacoes}
    Wait Until Element Is Visible    ${ficha_saude_geral.conduta.orientacoes}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.conduta.orientacoes}
    Scroll Element Into View    ${ficha_psicologia.orientacoes.descreva}
    Wait Until Element Is Visible    ${ficha_psicologia.orientacoes.descreva}    ${tempo_padrao}
    Input Text    ${ficha_psicologia.orientacoes.descreva}    ${mensagem_paciente}
    Sleep    ${tempo_elemento}

    ### Alta ###
    Scroll Element Into View    ${ficha_saude_geral.seguimento.alta}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.alta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.alta}

Preencher ficha campos obrigatórios para teste de anexo - dermatologia
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_dermatologia.ja_teve_cancer_de_pele}
    Wait Until Element Is Visible    ${ficha_dermatologia.ja_teve_cancer_de_pele}    ${tempo_padrao}
    Click Element    ${ficha_dermatologia.ja_teve_cancer_de_pele}
    Scroll Element Into View    ${ficha_dermatologia.tipo_de_cancer}
    Wait Until Element Is Visible    ${ficha_dermatologia.tipo_de_cancer}    ${tempo_padrao}
    Click Element    ${ficha_dermatologia.tipo_de_cancer}
    Scroll Element Into View    ${ficha_dermatologia.tipo_de_cancer.nao_informado}
    Wait Until Element Is Visible    ${ficha_dermatologia.tipo_de_cancer.nao_informado}    ${tempo_padrao}
    Click Element    ${ficha_dermatologia.tipo_de_cancer.nao_informado}

    ### Orientações ###
    Scroll Element Into View    ${ficha_dermatologia.outra_doenca_dermatologica}
    Wait Until Element Is Visible    ${ficha_dermatologia.outra_doenca_dermatologica}    ${tempo_padrao}
    Click Element    ${ficha_dermatologia.outra_doenca_dermatologica}
    Scroll Element Into View    ${ficha_dermatologia.orientacoes.descreva}
    Wait Until Element Is Visible    ${ficha_dermatologia.orientacoes.descreva}    ${tempo_padrao}
    Input Text    ${ficha_dermatologia.orientacoes.descreva}    ${mensagem_paciente}
    Sleep    ${tempo_elemento}

    ### Alta ###
    Scroll Element Into View    ${ficha_saude_geral.seguimento.alta}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.alta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.alta}

Preencher ficha campos obrigatórios para teste de anexo - odontopediatria
    Sleep    ${tempo_minimo}
    ### Alta ###
    Scroll Element Into View    ${ficha_saude_geral.seguimento.alta}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.alta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.alta}

Preencher ficha campos obrigatórios para teste de anexo - pediatria
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${ficha_pediatria.queixa_duracao_dos_sintomas}
    Wait Until Element Is Visible    ${ficha_pediatria.queixa_duracao_dos_sintomas}    ${tempo_padrao}
    Input Text    ${ficha_pediatria.queixa_duracao_dos_sintomas}    ${mensagem_paciente}

    ### hipotese diagnóstica ###
    Scroll Element Into View    ${ficha_pediatria.hipotese_diagnostica}
    Wait Until Element Is Visible    ${ficha_pediatria.hipotese_diagnostica}    ${tempo_padrao}
    Click Element    ${ficha_pediatria.hipotese_diagnostica}
    Scroll Element Into View    ${ficha_pediatria.hipotese_diagnostica.sintomas_ortopedicos}
    Wait Until Element Is Visible    ${ficha_pediatria.hipotese_diagnostica.sintomas_ortopedicos}    ${tempo_padrao}
    Click Element    ${ficha_pediatria.hipotese_diagnostica.sintomas_ortopedicos}
    Click Element    ${ficha_pediatria.hipotese_diagnostica}
    Scroll Element Into View    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}
    Click Element    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}
    Input Text    ${ficha_saude_geral.historia_clinica.classificacao_dos_sintomas.descreva}    ${mensagem_paciente}

    ### Orientações ###
    Scroll Element Into View    ${ficha_pediatria.orientacoes}
    Wait Until Element Is Visible    ${ficha_pediatria.orientacoes}    ${tempo_padrao}
    Click Element    ${ficha_pediatria.orientacoes}
    Scroll Element Into View    ${ficha_pediatria.orientacoes.descreva}
    Wait Until Element Is Visible    ${ficha_pediatria.orientacoes.descreva}    ${tempo_padrao}
    Input Text    ${ficha_pediatria.orientacoes.descreva}    ${mensagem_paciente}
    Sleep    ${tempo_elemento}
    
    ### Alta ###
    Scroll Element Into View    ${ficha_saude_geral.seguimento.alta}
    Wait Until Element Is Visible    ${ficha_saude_geral.seguimento.alta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.seguimento.alta}

Finalizar - ficha psicologia
    Scroll Element Into View    ${ficha_saude_geral.botao_salvar}
    Wait Until Element Is Visible    ${ficha_saude_geral.botao_salvar}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.botao_salvar}
    Scroll Element Into View    ${tela_pesquisa.botao_finalizar_e_salvar}
    Wait Until Element Is Visible    ${tela_pesquisa.botao_finalizar_e_salvar}    ${tempo_padrao}
    Click Button    ${tela_pesquisa.botao_finalizar_e_salvar}
    Scroll To Top

Finalizar - ficha dermatologia
    Scroll Element Into View    ${ficha_saude_geral.botao_salvar}
    Wait Until Element Is Visible    ${ficha_saude_geral.botao_salvar}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.botao_salvar}
    Scroll Element Into View    ${tela_pesquisa.botao_finalizar_e_salvar}
    Wait Until Element Is Visible    ${tela_pesquisa.botao_finalizar_e_salvar}    ${tempo_padrao}
    Click Button    ${tela_pesquisa.botao_finalizar_e_salvar}
    Scroll To Top

Finalizar - ficha pediatria
    Scroll Element Into View    ${ficha_saude_geral.botao_salvar}
    Wait Until Element Is Visible    ${ficha_saude_geral.botao_salvar}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.botao_salvar}
    Scroll Element Into View    ${tela_pesquisa.botao_finalizar_e_salvar}
    Wait Until Element Is Visible    ${tela_pesquisa.botao_finalizar_e_salvar}    ${tempo_padrao}
    Click Button    ${tela_pesquisa.botao_finalizar_e_salvar}
    Scroll To Top

Finalizar - ficha odontopediatria
    Scroll Element Into View    ${ficha_saude_geral.botao_salvar}
    Wait Until Element Is Visible    ${ficha_saude_geral.botao_salvar}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.botao_salvar}
    Scroll To Top

Finalizar - ficha saúde geral
    Scroll Element Into View    ${ficha_saude_geral.botao_concluir}
    Wait Until Element Is Visible    ${ficha_saude_geral.botao_concluir}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.botao_concluir}
    Scroll Element Into View    ${tela_pesquisa.botao_finalizar_e_salvar}
    Wait Until Element Is Visible    ${tela_pesquisa.botao_finalizar_e_salvar}    ${tempo_padrao}
    Click Button    ${tela_pesquisa.botao_finalizar_e_salvar}
    Sleep    ${tempo_minimo}

Concluir - atendimento ficha saúde geral
    Scroll Element Into View    ${ficha_saude_geral.botao_concluir}
    Wait Until Element Is Visible    ${ficha_saude_geral.botao_concluir}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.botao_concluir}
    Sleep    ${tempo_minimo}

Finalizar - ficha saúde geral2
    Scroll Element Into View    ${ficha_saude_geral.botao_finalizar}
    Wait Until Element Is Visible    ${ficha_saude_geral.botao_finalizar}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.botao_finalizar}

Preencher ficha campos obrigatórios para teste de Anexo
    [Arguments]    ${area}
    ${titulo}=    Set Variable    Preencher ficha campos obrigatórios para teste de anexo - ${area}
    Run Keyword    ${titulo}

Finalizar ficha teste de Anexo
    [Arguments]    ${area}
    ${titulo}=    Set Variable    Finalizar - ficha ${area}
    Run Keyword    ${titulo}

Solicitar Interconsulta e testa anexar exames
    Scroll Element Into View    ${ficha_saude_geral.botao_solicitar_interconsulta}
    Wait Until Element Is Visible    ${ficha_saude_geral.botao_solicitar_interconsulta}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.botao_solicitar_interconsulta}
    Sleep    ${tempo_elemento}
    Scroll Element Into View    ${ficha_saude_geral.solicitar_interconsulta.adicionar_especialidade}
    Wait Until Element Is Visible
    ...    ${ficha_saude_geral.solicitar_interconsulta.adicionar_especialidade}
    ...    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.solicitar_interconsulta.adicionar_especialidade}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.area}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.area}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.area}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.area.medico}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.area.medico}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.area.medico}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.especialidade}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.especialidade}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.especialidade}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.especialidade.cirurgiao_geral}
    Wait Until Element Is Visible
    ...    ${ficha_saude_geral.interconsulta.especialidade.cirurgiao_geral}
    ...    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.especialidade.cirurgiao_geral}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.classificacao}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.classificacao}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.classificacao}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.classificacao.amarelo}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.classificacao.amarelo}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.classificacao.amarelo}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.solicitacao}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.solicitacao}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.solicitacao}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.solicitacao.parecer}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.solicitacao.parecer}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.solicitacao.parecer}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.prioridade}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.prioridade}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.prioridade}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.prioridade.teste}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.prioridade.teste}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.prioridade.teste}
    Scroll Element Into View    ${ficha_saude_geral.interconsulta.descreva}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.descreva}    ${tempo_padrao}
    Input Text    ${ficha_saude_geral.interconsulta.descreva}    ${mensagem_paciente}

    Scroll Element Into View    ${fichas.solicitar_interconsulta.botao_anexar_exames}
    Wait Until Element Is Visible    ${fichas.solicitar_interconsulta.botao_anexar_exames}    ${tempo_padrao}
    Click Element    ${fichas.solicitar_interconsulta.botao_anexar_exames}

    Realizar lote de anexos solicitar interconsulta

    Scroll Element Into View    ${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}
    Wait Until Element Is Enabled    ${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Wait Until Element Is Visible    ${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}    ${tempo_padrao}
    Click Element    ${ficha_saude_geral.interconsulta.botao_gerar_interconsultas}
    Sleep    ${tempo_minimo}

### Keywords Compostas
Pesquisar paciente e iniciar atendimento
    [Arguments]    ${perfil_paciente_anexo}
    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${perfil_paciente_anexo}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista
    Abrir ficha do paciente
    Realizar nova consulta do paciente
    Realizar atendimento telessaúde

Pesquisar paciente e abrir prontuario
    [Arguments]    ${perfil_paciente_anexo}
    Acessar jornada do paciente
    Selecionar pesquisar em jornada do paciente
    Pesquisar um paciente pelo cpf    ${perfil_paciente_anexo}
    Clicar no botão pesquisar paciente
    Encontrar paciente em lista
    Abrir ficha do paciente

Realizar anexos multificha e multipaciente
    [Arguments]    ${perfil_paciente_anexo}    ${tipo_ficha}    ${nome_ficha}
    Pesquisar paciente e iniciar atendimento    ${perfil_paciente_anexo}
    Selecionar ficha clínica estática    ${tipo_ficha}
    Sleep    ${tempo_minimo}
    Preencher ficha campos obrigatórios para teste de Anexo    ${nome_ficha}
    Realizar anexo ficha clínica
    Finalizar ficha teste de Anexo    ${nome_ficha}
    Recusar assinatura digital da ficha médica

### Keywords Personalizadas
Loader Lot of Images
    [Arguments]    ${locator-input}    ${locator-label}
    ...    ${imagem-anexo1}    ${imagem-anexo2}    ${imagem-anexo3}    
    ...    ${imagem-anexo4}    ${imagem-anexo5}    ${imagem-anexo6}
    ...    ${name1}    ${name2}    ${name3}    ${name4}    ${name5}    ${name6}

    Choose File    ${locator-input}    ${imagem-anexo1}
    Wait Until Element Contains    ${locator-label}    ${name1}

    Choose File    ${locator-input}    ${imagem-anexo2}
    Wait Until Element Contains    ${locator-label}    ${name2}

    Choose File    ${locator-input}    ${imagem-anexo3}
    Wait Until Element Contains    ${locator-label}    ${name3}

    Choose File    ${locator-input}    ${imagem-anexo4}
    Wait Until Element Contains    ${locator-label}    ${name4}

    Choose File    ${locator-input}    ${imagem-anexo5}
    Wait Until Element Contains    ${locator-label}    ${name5}

    Choose File    ${locator-input}    ${imagem-anexo6}
    Wait Until Element Contains    ${locator-label}    ${name6}

Loader Individual Image
    [Arguments]    ${locator-input}    ${locator-label}    ${locator-button}    ${imagem-anexo}    ${name}

    Choose File    ${locator-input}    ${imagem-anexo}
    Wait Until Element Contains    ${locator-label}    ${name}
    Wait Until Element Is Enabled    ${locator-button}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Button    ${locator-button}
    Sleep    ${tempo_elemento}
    Wait Until Page Contains    100%    ${tempo_maximo}
    Execute JavaScript    document.querySelector('[type="file"]').value = '';

Loader Lot of Individual Images
    [Arguments]    ${locator-input}
    ...    ${imagem-anexo1}    ${imagem-anexo2}    ${imagem-anexo3}    
    ...    ${imagem-anexo4}    ${imagem-anexo5}    ${imagem-anexo6}
    ...    ${name1}    ${name2}    ${name3}    ${name4}    ${name5}    ${name6}
    
    Choose File    ${locator-input}    ${imagem-anexo1}
    Wait Until Page Contains    ${name1}

    Choose File    ${locator-input}    ${imagem-anexo2}
    Wait Until Page Contains    ${name2}

    Choose File    ${locator-input}    ${imagem-anexo3}
    Wait Until Page Contains    ${name3}

    Choose File    ${locator-input}    ${imagem-anexo4}
    Wait Until Page Contains    ${name4}

    Choose File    ${locator-input}    ${imagem-anexo5}
    Wait Until Page Contains    ${name5}

    Choose File    ${locator-input}    ${imagem-anexo6}
    Wait Until Page Contains    ${name6}