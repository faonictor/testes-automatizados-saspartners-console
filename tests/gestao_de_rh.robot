*** Settings ***
Resource   ../resources/navegador.resource
Resource   ../resources/login.resource
Resource   ../resources/gestao_de_rh.resource
Resource   ../resources/dados_comuns.resource

*** Test Cases ***
Cenário 1 - Pesquisar e exibir profissional em gestao de rh
    [Documentation]    Realiza uma pesquisa do profissional em gestão de RH e 
    ...    exibe os dados do perfil de acesso e profissional
    Preencher campos login   ${usuario_admin}    ${senha_admin}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar popups
    Verificar sucesso do login
    Acessar gestão de RH
    Selecionar gestão de usuários em gestão de RH
    Pesquisar usuario pelo cpf em gestão de RH    ${usuario_profissional}
    Encontrar profissional na lista e visualizar
    Visualizar informações do profissional

Cenário 2 - Cadastro de profissional rota gestao de rh
    [Documentation]    Realiza o cadastro de um novo usuário profissional...
    ...    através da rota de gestão de usuários em gestão de rh
    Preencher campos login   ${usuario_admin}    ${senha_admin}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar popups
    Verificar sucesso do login
    Acessar gestão de RH
    Selecionar gestão de usuários em gestão de RH
    Selecionar adicionar e iniciar novo cadastro
    Preencher formulário de cadastro profissional

Cenário 3 - Cadastro e ajuste de perfil profissional rota gestao de rh
    [Documentation]    Realiza o cadastro de um novo usuário profissional...
    ...    através da rota de gestão de usuários em gestão de rh e ajusta o perfil do profissional
    Preencher campos login   ${usuario_admin}    ${senha_admin}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar popups
    Verificar sucesso do login
    Acessar gestão de RH
    Selecionar gestão de usuários em gestão de RH
    Selecionar adicionar e iniciar novo cadastro
    Preencher formulário de cadastro profissional
    Acessar gestão de RH
    Selecionar gestão de usuários em gestão de RH
    Pesquisar usuario pelo cpf em gestão de RH    ${usuario_cpf_acesso}
    Encontrar profissional na lista e editar
    Editar profissional em gestão de RH
    Pesquisar usuario pelo cpf em gestão de RH    ${usuario_cpf_acesso}
    Encontrar profissional na lista e visualizar
    Visualizar informações do profissional

Cenário 4 - Ajustar perfil e inativar profissional em gestao de rh
    [Documentation]    Tornando o usuário paciente remove os dados de profissão e inativa o usuário
    Preencher campos login   ${usuario_admin}    ${senha_admin}
    Clicar no botão acessar conta
    Selecionar unidade de atendimento
    Fechar popups
    Verificar sucesso do login
    Acessar gestão de RH
    Selecionar gestão de usuários em gestão de RH
    Pesquisar usuário pelo nome em gestão de RH    ${tipo_profissional}
    Encontrar usuario na lista e editar
    Inativar usuario em gestão de RH
    Pesquisar usuario pelo cpf em gestão de RH    ${cpf_usuario_inativado}
    Encontrar profissional na lista e visualizar
    Visualizar informações do profissional