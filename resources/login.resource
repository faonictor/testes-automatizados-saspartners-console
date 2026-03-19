*** Settings ***
Documentation       Este arquivo contém tudo relacionado aos processos de autenticação, acesso(login) e cadastros externos.

Library             SeleniumLibrary
Resource            navegador.resource
Resource            dados_comuns.resource


*** Variables ***
### Variáveis que estão na tela de login
${login.cpf}                                            xpath://input[@id="input-text-CPF/RANI ou E-mail"]
${login.senha}                                          xpath://input[@id="input-password-Senha"]
${login.acessar}                                        xpath://button[contains(text(), 'Acessar')]
${login.primeiro_acesso}                                xpath://button[text()="Primeiro acesso"]
${login.recuperar_senha}                                xpath://button[text()="Recuperar senha"]
${login.criar_senha}                                    xpath://button[text()="Criar senha"]

### Variáveis que estão na tela de seleção de unidade de atendimento
${login.unidade_de_atendimento}                         xpath://*[@id="input-selectUnidade de atendimento"]/div
${login.unidade_de_atendimento.smart}                   xpath://*[@id="input-selectUnidade de atendimento"]/div/div[2]/ul[2]/li[2]
${login.unidade_de_atendimento.continuar}               xpath://button[text()='Continuar']

### Variáveis que estão na tela de primeiro acesso
${primeiro_acesso.cpf}                                  xpath://input[@id="input-text-CPF"]
${primeiro_acesso.data_de_nascimento}                   xpath://input[@id="input-text-Data de nascimento (00/00/0000)"]
${primeiro_acesso.email}                                xpath://input[@id="input-text-E-mail"]
${primeiro_acesso.telefones.etiqueta}                   xpath://span[contains(@class, 'dropdown-btn')][1]
${primeiro_acesso.telefones.etiqueta.contato}           xpath://li[contains(@class, 'multiselect-item-checkbox')]
${primeiro_acesso.telefones.ddd}                        xpath://*[@id="input-text-DDD"]
${primeiro_acesso.telefones.numero}                     xpath://input[@id="input-text-Número"]
${primeiro_acesso.telefones.enviar}                     xpath://button[contains(text(), 'Enviar')]
${primeiro_acesso.nome}                                 xpath://input[@id="input-text-Nome"]
${primeiro_acesso.sobrenome}                            xpath://input[@id="input-text-Sobrenome"]
${primeiro_acesso.nome_social}                          xpath://input[@id="input-text-Nome social"]
${primeiro_acesso.cns}                                  xpath://input[@id="input-text-Cartão SUS (CNS)"]
${primeiro_acesso.genero}                               xpath://label[contains(text(), 'Gênero')]/following::span[contains(@class, 'dropdown-btn')][1]
${primeiro_acesso.genero.cisgenero}                     xpath://li[contains(@class, 'multiselect-item-checkbox') and .//input[@aria-label='Cisgênero']]//div[text()='Cisgênero']
${primeiro_acesso.sexo}                                 xpath://label[contains(text(), 'Sexo')]/following::span[contains(@class, 'dropdown-btn')][1]
${primeiro_acesso.sexo.masculino}                       xpath://li[contains(@class, 'multiselect-item-checkbox') and .//input[@aria-label='Masculino']]//div[text()='Masculino']
${primeiro_acesso.raca}                                 xpath://label[contains(text(), 'Raça/cor')]/following::span[contains(@class, 'dropdown-btn')][1]
${primeiro_acesso.raca.preta}                           xpath://li[contains(@class, 'multiselect-item-checkbox') and .//input[@aria-label='Preta']]//div[text()='Preta']
${primeiro_acesso.etnia}                                xpath://input[@id="input-text-Etnia"]
${primeiro_acesso.nome_da_mae}                          xpath://input[@id="input-text-Nome da Mãe"]
${primeiro_acesso.endereco.cep.sim}                     xpath://label[contains(text(), 'Sim') and .//input[@name='knowCEP']]
${primeiro_acesso.endereco.cep}                         xpath://input[@id="input-text-CEP"]
${primeiro_acesso.endereco.pesquisar_cep}               xpath://button[contains(text(), 'Pesquisar CEP')]
${primeiro_acesso.endereco.unidade_da_federacao}        xpath://label[contains(text(), 'Unidade da Federação')]
${primeiro_acesso.endereco.logradouro}                  xpath://input[@id="input-text-Logradouro"]
${primeiro_acesso.endereco.numero}                      xpath://input[@id='input-text-Número' and contains(@class, 'ng-pristine')]
${primeiro_acesso.endereco.bairro}                      xpath://input[@id="input-text-Bairro"]
${primeiro_acesso.endereco.complemento}                 xpath://input[@id="input-text-Complemento"]
${primeiro_acesso.observacao}                           xpath://textarea[@id="input-text-Observação"]
${primeiro_acesso.cadastrar}                            xpath://button[contains(text(), 'Cadastrar')]
${primeiro_acesso.termos_de_uso.aceitar}                xpath://button[contains(text(), 'Aceitar')]
${primeiro_acesso.codigo_validacao.email}               xpath://button[text()="E-Mail"]

### Variáveis que estão nas tela de validação de código de cadastro
${primeiro_acesso.validacao.codigo_cadastro}            xpath://input[@id="input-text-Código de validação"]
${primeiro_acesso.validacao.proximo}                    xpath://button[contains(text(), 'Próximo >')]
${primeiro_acesso.validacao.nova_senha}                 xpath://input[@id="input-password-Nova senha"]
${primeiro_acesso.validacao.nova_senha_valida}          xpath://input[@id="input-password-Confirme a nova senha"]
${primeiro_acesso.validacao.aceitar_termos}             xpath://input[@id="agree_terms"]
${primeiro_acesso.validacao.alterar_senha}              xpath://button[text()=" Alterar senha"]
${primeiro_acesso.validacao.voltar}                     xpath:(//a[text()="Voltar"])[2]

### Variáveis que estão na tela de validação de recuperação de senha
${recuperar_senha.cpf}                                  xpath://input[@id="input-text-"]
${recuperar_senha.codigo_validacao.email}               xpath://button[text()="E-Mail"]
${recuperar_senha.senha}                                xpath://button[text()=" Solicitar nova senha"]
${recuperar_senha.validacao.codigo_nova_senha}          xpath:(//input[@id='input-text-Código de validação'])[2]
${recuperar_senha.validacao.proximo}                    xpath://button[text()=" Próximo"]    ### xpath:(//button[contains(., 'Próximo')])[2]
${recuperar_senha.validacao.nova_senha}                 xpath://input[@id="input-password-Nova senha"]
${recuperar_senha.validacao.nova_senha_valida}          xpath://input[@id="input-password-Confirme a nova senha"]
${recuperar_senha.validacao.aceitar_termos}             xpath://input[@id="agree_terms"]
${recuperar_senha.validacao.alterar_senha}              xpath://button[text()=" Alterar senha"]
${recuperar_senha.validacao.voltar}                     xpath:(//a[text()="Voltar"])[2]

### Variáveis que estão nas telas de acesso(login) ao gmail
${gmail.email_padrao}                                   siastestesrobot@gmail.com
${gmail.senha_padrao}                                   Smart10*ROBOT
${gmail.url}                                            https://mail.google.com
${gmail.login.email}                                    xpath://input[@id="identifierId"]
${gmail.login.senha}                                    xpath://input[@name='Passwd' or @aria-label='Digite sua senha']    ### //*[@id="password"]/div[1]/div/div[1]/input
${gmail.login.email_avancar}                            xpath://*[@id="identifierNext"]/div/button
${gmail.login.senha_avancar}                            xpath://*[@id="passwordNext"]/div/button
${gmail.caixa_de_entrada.primeiro_email_senha}          xpath://span[contains(text(), "Nova Senha")]/ancestor::tr
${gmail.caixa_de_entrada.codigo_validacao_senha}        xpath://p[contains(text(), "Seu código de verificação")]/strong
${gmail.caixa_de_entrada.primeiro_email_cadastro}       xpath://span[contains(text(), "Código de validação de cadastro")]/ancestor::tr
${gmail.caixa_de_entrada.codigo_validacao_cadastro}     xpath://p/strong

### Variáveis que estão na tela de login pós-acesso
${dashboard.janela_principal}                           xpath://*[@id="main-wrapper"]/div/div[1]/app-dashboard
${dashboard.janela_principal.memed}                     xpath://div[contains(@class, 'swal2-popup')]
${dashboard.unidade_de_atendimento}                     xpath://div[contains(@class, 'modal-content')]


*** Keywords ***
### Keywords de ações para botões da tela de login
Clicar no botão acessar conta
    Mouse Over    ${login.acessar}
    Wait Until Element Is Visible    ${login.acessar}    ${tempo_padrao}
    Sleep    ${tempo_minimo}
    Click Button    ${login.acessar}

Clicar no botão primeiro acesso
    Click Button    ${login.primeiro_acesso}

Clicar no botão recuperar senha
    Click Button    ${login.recuperar_senha}

### Keywords de ações para realização de acesso (login)
Realizar login
    Abrir navegador de teste    ${devParceiros}
    Preencher campos login    ${usuario_joao}    ${senha_joao}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar popups
    Confirmar unidade de atendimento após login
    Verificar Sucesso do Login

Preencher campos login
    [Arguments]    ${cpf}    ${senha}
    Input Text    ${login.cpf}    ${cpf}
    Input Text    ${login.senha}    ${senha}

# Selecionar unidade de atendimento - Legado
#    Wait Until Element Is Visible    ${login.unidade_de_atendimento}    ${tempo_padrao}
#    Click Element    ${login.unidade_de_atendimento}
#    Wait Until Element Is Visible    ${login.unidade_de_atendimento.smart}    ${tempo_padrao}
#    Click Element    ${login.unidade_de_atendimento.smart}
#    Sleep    ${tempo_minimo}
#    Click Button    ${login.unidade_de_atendimento.continuar}

Selecionar unidade de atendimento
    ${visivel}    Run Keyword And Return Status    
    ...    Wait Until Element Is Visible    ${login.unidade_de_atendimento}    ${tempo_elemento}
    IF    ${visivel}
        Click Element    ${login.unidade_de_atendimento}
        Wait Until Element Is Visible    ${login.unidade_de_atendimento.smart}    ${tempo_padrao}
        Click Element    ${login.unidade_de_atendimento.smart}
        Sleep    ${tempo_minimo}
        Click Button    ${login.unidade_de_atendimento.continuar}
    END

Confirmar unidade de atendimento após login
    Sleep    ${tempo_minimo}
    ${botao_visivel}    Run Keyword And Return Status
    ...    Element Should Be Visible
    ...    ${login.unidade_de_atendimento.continuar}
    ...    ${tempo_padrao}
    IF    '${botao_visivel}' == 'True'
        Wait Until Element Is Visible    ${login.unidade_de_atendimento}    ${tempo_padrao}
        Sleep    ${tempo_minimo}
        Click Button    ${login.unidade_de_atendimento.continuar}
    END

# Fechar popups - Legado
#    Wait Until Element Is Visible    ${dashboard.janela_principal.memed}    ${tempo_padrao}
#    Press Keys    ${dashboard.janela_principal.memed}    ESC
#    Sleep    ${tempo_elemento}
#    Press Keys    ${dashboard.unidade_de_atendimento}    ESC
#    Wait Until Element Is Not Visible    ${dashboard.unidade_de_atendimento}    ${tempo_padrao}

Fechar popups
    ${popup_visivel}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    ${dashboard.janela_principal.memed}
    ...    ${tempo_elemento}
    IF    ${popup_visivel}
        Press Keys    ${dashboard.janela_principal.memed}    ESC
        Sleep    ${tempo_elemento}
        Press Keys    ${dashboard.unidade_de_atendimento}    ESC
        Wait Until Element Is Not Visible    ${dashboard.unidade_de_atendimento}    ${tempo_padrao}
    END

Verificar sucesso do login
    Wait Until Element Is Visible    ${dashboard.janela_principal}    ${tempo_padrao}

### Keywords de ações para tela de primeiro acesso
Preencher formulário de cadastro primeiro acesso parte 1
    ### Gerar cpf pela função
    ${usuario_cpf_gerado}=    Gerar Novo CPF
    Set Suite Variable    ${usuario_cpf_acesso}    ${usuario_cpf_gerado}    # torna o cpf gerado global durante o teste

    Input Text    ${primeiro_acesso.cpf}    ${usuario_cpf_gerado}
    Input Text    ${primeiro_acesso.data_de_nascimento}    ${paciente_nascimento}
    Sleep    ${tempo_minimo}

    # Gerar e-mail pela função
    ${paciente_email_acesso}    Gerar Novo Email
    Input Text    ${primeiro_acesso.email}    ${paciente_email_acesso}
    Sleep    ${tempo_minimo}

    Scroll Element Into View    ${primeiro_acesso.telefones.etiqueta}
    Wait Until Element Is Visible    ${primeiro_acesso.telefones.etiqueta}    ${tempo_minimo}
    Click Element    ${primeiro_acesso.telefones.etiqueta}
    Scroll Element Into View    ${primeiro_acesso.telefones.etiqueta.contato}
    Wait Until Element Is Visible    ${primeiro_acesso.telefones.etiqueta.contato}    ${tempo_minimo}
    Click Element    ${primeiro_acesso.telefones.etiqueta.contato}
    Input Text    ${primeiro_acesso.telefones.ddd}    ${paciente_ddd}
    Input Text    ${primeiro_acesso.telefones.numero}    ${paciente_telefone}
    Scroll Element Into View    ${primeiro_acesso.telefones.enviar}
    Wait Until Element Is Visible    ${primeiro_acesso.telefones.enviar}
    Click Element    ${primeiro_acesso.telefones.enviar}

Preencher formulário de cadastro primeiro acesso parte 2
    # Input Text    ${primeiro_acesso.cns}    ${paciente_cns}

    ### Gerar dados pela função
    ${usuario_dados}    Gerar Dados Usuario    ${usuario_cpf_acesso}    ${tipo_profissional}=paciente
    Set Suite Variable    ${usuario}    ${usuario_dados}    # torna os dados gerados globais durante o teste

    Scroll Element Into View    ${primeiro_acesso.nome}
    Wait Until Element Is Visible    ${primeiro_acesso.nome}
    Input Text    ${primeiro_acesso.nome}    ${usuario['nome']}
    Input Text    ${primeiro_acesso.sobrenome}    ${usuario['sobrenome']}
    Input Text    ${primeiro_acesso.nome_social}    ${usuario['nome_social']}
    Scroll Element Into View    ${primeiro_acesso.genero}
    Wait Until Element Is Visible    ${primeiro_acesso.genero}
    Click Element    ${primeiro_acesso.genero}
    Scroll Element Into View    ${primeiro_acesso.genero.cisgenero}
    Wait Until Element Is Visible    ${primeiro_acesso.genero.cisgenero}
    Click Element    ${primeiro_acesso.genero.cisgenero}
    Click Element    ${primeiro_acesso.sexo}
    Click Element    ${primeiro_acesso.sexo.masculino}
    Scroll Element Into View    ${primeiro_acesso.raca}
    Wait Until Element Is Visible    ${primeiro_acesso.raca}
    Click Element    ${primeiro_acesso.raca}
    Scroll Element Into View    ${primeiro_acesso.raca.preta}
    Wait Until Element Is Visible    ${primeiro_acesso.raca.preta}
    Click Element    ${primeiro_acesso.raca.preta}
    Input Text    ${primeiro_acesso.etnia}    ${etnia}
    Input Text    ${primeiro_acesso.nome_da_mae}    ${usuario['nome_mae']}

Preencher formulário de cadastro primeiro acesso parte 3
    Scroll Element Into View    ${primeiro_acesso.endereco.cep.sim}
    Wait Until Element Is Visible    ${primeiro_acesso.endereco.cep.sim}    ${tempo_padrao}
    Click Element    ${primeiro_acesso.endereco.cep.sim}
    Scroll Element Into View    ${primeiro_acesso.endereco.cep}
    Wait Until Element Is Visible    ${primeiro_acesso.endereco.cep}    ${tempo_padrao}
    Input Text    ${primeiro_acesso.endereco.cep}    ${cep}
    Click Button    ${primeiro_acesso.endereco.pesquisar_cep}
    Sleep    ${tempo_minimo}
    Scroll Element Into View    ${primeiro_acesso.endereco.unidade_da_federacao}
    Input Text    ${primeiro_acesso.endereco.logradouro}    ${usuario['logradouro']}
    Sleep    1s
    Input Text    ${primeiro_acesso.endereco.numero}    ${usuario['numero']}
    Input Text    ${primeiro_acesso.endereco.bairro}    ${usuario['bairro']}
    Input Text    ${primeiro_acesso.endereco.complemento}    ${complemento}
    Scroll Element Into View    ${primeiro_acesso.observacao}
    Input Text    ${primeiro_acesso.observacao}    ${observacao}
    Scroll Element Into View    ${primeiro_acesso.cadastrar}
    Wait Until Element Is Visible    ${primeiro_acesso.cadastrar}    ${tempo_padrao}
    Click Element    ${primeiro_acesso.cadastrar}

Aceitar termos de uso e política de privacidade
    Scroll Element Into View    ${primeiro_acesso.termos_de_uso.aceitar}
    Wait Until Element Is Visible    ${primeiro_acesso.termos_de_uso.aceitar}    ${tempo_padrao}
    Click Element    ${primeiro_acesso.termos_de_uso.aceitar}
    Wait Until Element Is Visible    ${primeiro_acesso.codigo_validacao.email}    ${tempo_padrao}
    Click Button    ${primeiro_acesso.codigo_validacao.email}
    Sleep    ${tempo_elemento}

Criar nova senha
    Click Button    ${primeiro_acesso.validacao.proximo}
    Input Password    ${primeiro_acesso.validacao.nova_senha}    ${senha_padrao}
    Input Password    ${primeiro_acesso.validacao.nova_senha_valida}    ${senha_padrao}
    Click Element    ${primeiro_acesso.validacao.aceitar_termos}
    Click Button    ${primeiro_acesso.validacao.alterar_senha}

### Keywords de ações para captura de códigos pelo gmail
Abrir gmail e coletar código cadastro
    ### Abre o Gmail em uma nova aba
    Execute JavaScript    window.open("${gmail.url}", "_blank")
    ${original_tab}    Get Window Handles
    ${original_tab}    Set Variable    ${original_tab}[0]
    Switch Window    NEW
    Set Selenium Implicit Wait    ${tempo_padrao}

    ### faz o Login no Gmail
    Input Text    ${gmail.login.email}    ${gmail.email_padrao}
    Click Button    ${gmail.login.email_avancar}
    Wait Until Element Is Visible    ${gmail.login.senha}    ${tempo_padrao}
    Input Text    ${gmail.login.senha}    ${gmail.senha_padrao}
    Click Button    ${gmail.login.senha_avancar}

    ### Encontra o e-mail mais recente com o código de verificação e abre a visualização
    Wait Until Element Is Visible    ${gmail.caixa_de_entrada.primeiro_email_cadastro}    ${tempo_maximo}
    Sleep    ${tempo_elemento}
    Click Element    ${gmail.caixa_de_entrada.primeiro_email_cadastro}
    Wait Until Element Is Visible    ${gmail.caixa_de_entrada.codigo_validacao_cadastro}    ${tempo_maximo}

    ### Extrai o código diretamente
    ${codigo_gmail}    Get text    ${gmail.caixa_de_entrada.codigo_validacao_cadastro}

    ### Volta para a aba original e preenche o campo de verificação
    Set Suite Variable    ${codigo_verificacao}    ${codigo_gmail}
    Log    Código de verificação extraído: ${codigo_verificacao}
    Sleep    ${tempo_minimo}
    Switch Window    ${original_tab}
    Sleep    ${tempo_minimo}
    Input text    (//input[@id='input-text-Código de validação'])[3]    ${codigo_verificacao}

Abrir gmail e coletar código nova senha
    ### Abre o Gmail em uma nova aba
    Execute JavaScript    window.open("${gmail.url}", "_blank")
    ${original_tab}    Get Window Handles
    ${original_tab}    Set Variable    ${original_tab}[0]
    Switch Window    NEW
    Set Selenium Implicit Wait    1${tempo_elemento}

    ### faz o Login no Gmail
    Input Text    ${gmail.login.email}    ${gmail.email_padrao}
    Click Button    ${gmail.login.email_avancar}
    Wait Until Element Is Visible    ${gmail.login.senha}    ${tempo_padrao}
    Input Text    ${gmail.login.senha}    ${gmail.senha_padrao}
    Click Button    ${gmail.login.senha_avancar}

    ### Encontra o e-mail mais recente com o código de verificação e abre a visualização
    Wait Until Element Is Visible    ${gmail.caixa_de_entrada.primeiro_email_senha}    ${tempo_maximo}
    Sleep    ${tempo_minimo}
    Click Element    ${gmail.caixa_de_entrada.primeiro_email_senha}
    Wait Until Element Is Visible    ${gmail.caixa_de_entrada.codigo_validacao_cadastro}    ${tempo_maximo}
    ${codigo_gmail}    Get Text    ${gmail.caixa_de_entrada.codigo_validacao_senha}
    Set Suite Variable    ${codigo_verificacao}    ${codigo_gmail}
    Log    Código de verificação extraído: ${codigo_verificacao}
    Switch Window    ${original_tab}
    Input Text    (//input[@id='input-text-Código de validação'])[2]    ${codigo_verificacao}

### Keywords de ações para tela de validação de cadastro e recuperação de senha
Solicitar nova senha
    Input Text    ${recuperar_senha.cpf}    ${usuario_joao}
    Click Button    ${recuperar_senha.senha}
    Wait Until Element Is Visible    ${recuperar_senha.codigo_validacao.email}    ${tempo_padrao}
    Click Button    ${recuperar_senha.codigo_validacao.email}
    Sleep    ${tempo_elemento}

Digitar nova senha
    [Arguments]    ${nova_senha}
    Wait Until Element Is Enabled    ${recuperar_senha.validacao.proximo}    ${tempo_padrao}
    Click Button    ${recuperar_senha.validacao.proximo}
    Input Password    ${primeiro_acesso.validacao.nova_senha}    ${nova_senha}
    Input Password    ${primeiro_acesso.validacao.nova_senha_valida}    ${nova_senha}
    Click Element    ${recuperar_senha.validacao.aceitar_termos}
    Click Button    ${recuperar_senha.validacao.alterar_senha}

Voltar para tela inicial
    Click Element    ${primeiro_acesso.validacao.voltar}
