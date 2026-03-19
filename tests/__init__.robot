*** Settings ***
Documentation    Setup inicial de navegador "Google for Test" comum para todos as suítes de testes
Library    SeleniumLibrary
Resource    ../resources/navegador.resource
Resource    ../resources/dados_comuns.resource
Test Setup    Abrir navegador de teste    ${devParceiros}
Test Teardown    Fechar navegador de teste