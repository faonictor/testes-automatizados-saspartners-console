*** Settings ***
Documentation       Este arquivo contém tudo relacionado às configurações de ambiente do Navegador Chrome for Test e funções de JavaScript/Python Específicas deste projeto.

Library             SeleniumLibrary
Library             ../resources/scripts/gerador_email.py    ### Importa a função de Alias no Email
Library             ../resources/scripts/gerador_cpf.py    ### Importa a função de Gerador de CPF
Library             ../resources/scripts/gerador_nomes.py    ### Importa a função de Gerador de Dados de Nomes
Resource            dados_comuns.resource


*** Variables ***
### Variáveis de sistema para configuração das pastas do navegador
${resources}            ${EXECDIR}/drivers
${chrome_test}          ${resources}/chrome-win64/chrome.exe
${chromedriver_path}    ${resources}/chromedriver-win64/chromedriver.exe


*** Keywords ***
Abrir navegador de teste
    [Documentation]    Esta Keyword configura e executa a suíte de inicialização do navegador de testes.
    [Arguments]    ${url}    ### Recebe qualquer URL como parâmetro nesta keyword

    ### Importa o módulo ChromeOptions do Selenium e define o caminho do executável do Chrome Test
    ${options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${options.binary_location} =    Set Variable    ${chrome_test}

    ### Adiciona as opções para resolver erros de sandbox
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage

    ### Configurações para testes
    Call Method    ${options}    add_argument    --disable-gpu    ### desativa o uso de gpu na renderização
    Call Method    ${options}    add_argument    --enable-unsafe-swiftshader
    Call Method    ${options}    add_argument    --ignore-certificate-errors    ### ignora https ou certificados vencidos
    Call Method    ${options}    add_argument    --log-level\=3    ### produz apenas logs de erros criticos

    ### Configura Permissões de Câmeras e Microfone
    Call Method    ${options}    add_argument    --use-fake-ui-for-media-stream
    Call Method    ${options}    add_argument    --use-fake-device-for-media-stream

    ### Inicia em modo anônimo
    Call Method    ${options}    add_argument    --incognito

    ### Desabilita diálogo de impressão
    ${prefs} =    Create Dictionary
    ...    plugins.always_open_pdf_externally=${True}    ### Força download em vez de abrir
    ...    download.default_directory=${resources}    ### Define pasta de download
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    ### Configura a abertura do browser chrome com o caminho do executável do Chrome Test
    ${service} =    Evaluate
    ...    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r"${chromedriver_path.replace('/', '\\')}")
    ...    sys
    Create WebDriver    Chrome    service=${service}    options=${options}
    Go To    ${url}
    Maximize Browser Window

Fechar navegador de teste
    [Documentation]    Esta Keyword executa é a suíte de finalização do teste.
    Sleep    ${tempo_elemento}
    Close All Browsers

Scroll To Top
    [Documentation]    Função em JavaScript para Scroll da tela para a posição top 0.
    ### Foi preciso criar esta função pois as opções nativas do selenium não se comportaram corretamente.
    Execute JavaScript    window.scrollTo(0, 0)

Drag and Drop Elements
    [Documentation]    Esta Keyword executa a função para arrastar elementos "draggables" pela tela.
    ### Foi preciso criar esta função pois as opções nativas do selenium não se comportaram corretamente.
    [Arguments]    ${offset}    ${locator}
    ${elemento} =    Get WebElement    ${locator}
    Execute JavaScript    arguments[0].style.transform = `translate(0px, ${${offset}}px)`;    ARGUMENTS    ${elemento}
    RETURN    ${elemento}

Is Multiselect Empty
    [Arguments]    ${dropdown_locator}
    ${status} =    Run Keyword And Return Status
    ...    Element Should Be Visible
    ...    ${dropdown_locator}//span[@class='selected-item']
    ${is_empty} =    Evaluate    not ${status}
    RETURN    ${is_empty}

Is Input Empty
    [Arguments]    ${input_locator}
    ${value} =    Get Element Attribute    ${input_locator}    value
    ${is_empty} =    Evaluate    not ${value}
    RETURN    ${is_empty}

Acessar URL
    [Arguments]    ${url}
    Go To    ${url}

Gerar novo email
    [Documentation]    Esta keyword chama um função em python que gera um novo email com alias personalizado
    ${email_gerado} =    Get Next Email
    RETURN    ${email_gerado}

Gerar novo cpf
    [Documentation]    Esta keyword chama um função em python que gera um novo CPF
    ${cpf_gerado} =    Get Next CPF
    RETURN    ${cpf_gerado}

Gerar Dados Usuario
    [Documentation]    Gera dados de usuário (Paciente ou Profissional) a partir de um CPF existente
    [Arguments]    ${cpf}    ${tipo_usuario}
    ${usuario} =    Get Next Dados    ${cpf}    ${tipo_usuario}
    RETURN    ${usuario}
