*** Settings ***
Resource   ../resources/navegador.resource
Resource   ../resources/dados_comuns.resource
Resource   ../resources/login.resource


*** Test Cases ***
Cenário 1 - Navegador Setup
    [Documentation]    Apenas para registrar o modelo de setup do navegador | já configurado como suíte no __init__.robot
    Acessar URL    ${devParceiros}

Cenário 2 - Login de administrador no ambiente
    [Documentation]    Apenas realiza o Login de "Administador" no ambiente escohido no setup
    Preencher campos login   ${usuario_admin}    ${senha_admin}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar popups
    Verificar sucesso do login

Cenário 3 - Login de Paciente no ambiente
    [Documentation]    Apenas realiza o Login de "Paciente" do ambiente escohido no setup
    Preencher campos login   ${usuario_paciente}    ${senha_padrao}
    Clicar no botão acessar conta
    Verificar sucesso do login

Cenário 4 - Primeiro Acesso
    [Documentation]    Realiza o cadastro de primeiro acesso de um novo usuário do tipo paciente...
    ...    através da página de login
    Clicar no botão primeiro acesso
    Preencher formulário de cadastro primeiro acesso parte 1
    Preencher formulário de cadastro primeiro acesso parte 2
    Preencher formulário de cadastro primeiro acesso parte 3
    Aceitar termos de uso e política de privacidade
    Abrir gmail e coletar código cadastro
    Criar nova senha
    Voltar para tela inicial
    Preencher campos login   ${usuario_cpf_acesso}    ${senha_padrao}
    Clicar no botão acessar conta
    
Cenário 5 - Teste de Recuperar Senha com Validação de Login
    [Documentation]    Realiza o teste de recuperação de senha através do gmail
    Clicar no botão recuperar senha
    Solicitar nova senha
    Abrir gmail e coletar código nova senha
    Digitar nova senha    ${senha_admin}
    Voltar para tela inicial
    Preencher campos login   ${usuario_admin}    ${senha_admin}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar popups
    Verificar sucesso do login