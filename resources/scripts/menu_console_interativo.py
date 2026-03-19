import os
import shutil
import subprocess
import webbrowser

pasta_testes = "./tests"

def limpar_tela():
    os.system('cls' if os.name == 'nt' else 'clear')

def ajustar_tamanho_terminal(cols, lines):
    # Ajusta a janela do terminal em colunas x linhas
    comando = f"mode con: cols={cols} lines={lines}"
    os.system(comando)

def listar_suites():
    return [
        f for f in os.listdir(pasta_testes)
        if f.endswith(".robot") and not f.lower().startswith("__init__")
    ]

def formatar_nome_suite(nome_arquivo):
    return nome_arquivo.replace(".robot", "").replace("_", " ").upper()

def listar_cenarios(caminho_arquivo):
    cenarios = []
    dentro_test_cases = False
    with open(caminho_arquivo, "r", encoding="utf-8") as f:
        for linha in f:
            linha_strip = linha.strip()
            if linha_strip.startswith("*** Test Cases ***"):
                dentro_test_cases = True
            elif linha_strip.startswith("***"):
                dentro_test_cases = False
            elif dentro_test_cases and linha_strip and not linha.startswith("    "):
                cenarios.append(linha_strip)
    return cenarios

def exibir_menu(lista, titulo="Selecione uma opção", mensagem_inicial=None, incluir_sair=True, incluir_voltar=False):
    limpar_tela()

    if mensagem_inicial:
        print(f"{mensagem_inicial}\n")
    
    print(f"[ {titulo} ]\n")

    opcoes_numeradas = [
        f"{str(idx + 1).zfill(2)} - {item}" for idx, item in enumerate(lista)
    ]

    if incluir_voltar:
        opcoes_numeradas.append("00 - Voltar")
    elif incluir_sair:
        opcoes_numeradas.append("00 - Sair")

    largura_max = max(len(item) for item in opcoes_numeradas) + 4  # 4 = espaços e bordas

    # Linha superior
    print("+" + "-" * largura_max + "+")

    for idx, item in enumerate(opcoes_numeradas):
        espacos = largura_max - len(item)
        print(f"| {item}{' ' * (espacos - 1)}|")

        # Linha divisória entre itens (exceto no último)
        if idx != len(opcoes_numeradas) - 1:
            print("|" + "-" * largura_max + "|")

    # Linha inferior
    print("+" + "-" * largura_max + "+")

    escolha = input("\n>> Digite o número da opção desejada: ")
    return int(escolha) if escolha.isdigit() else -1


# def executar_teste(nome_teste, suite):
#     limpar_tela()
#     print(f"Executando: {nome_teste}\n")
#     #subprocess.run(["robot", "-t", nome_teste, os.path.join(pasta_testes, suite)], shell=True)
#     subprocess.run(["robot", "-t", nome_teste, pasta_testes], shell=True)
#     input("\nPressione Enter para continuar...")

def limpar_logs():
    pasta_logs = "logs"
    if os.path.exists(pasta_logs):
        shutil.rmtree(pasta_logs)
        
def executar_teste(nome_teste, suite):
    limpar_logs()
    limpar_tela()
    print(f"Executando: {nome_teste}\n")

    pasta_logs = "logs"
    os.makedirs(pasta_logs, exist_ok=True)  # Cria a pasta se não existir

    subprocess.run([
        "robot",
        "-t", nome_teste,
        "--outputdir", pasta_logs,
        "--output", "output.xml",
        "--log", "log.html",
        "--report", "report.html",
        pasta_testes  # Executa a pasta inteira (ativa o __init__.robot)
    ], shell=True)

    caminho_log = os.path.abspath(os.path.join(pasta_logs, "log.html"))
    if os.path.exists(caminho_log):
        print("\nAbrindo arquivo de log...")
        webbrowser.open(f"file:///{caminho_log}")
    else:
        print("Arquivo de log não encontrado.")

    input("\nPressione Enter para continuar...")

def verificar_drivers():
    pasta_driver = "drivers"
    chromedriver_path = os.path.join(pasta_driver, "chromedriver-win64", "chromedriver.exe")
    chrome_for_test_path = os.path.join(pasta_driver, "chrome-win64", "chrome.exe")  # Ajuste para o executável correto

    # Verifica chromedriver
    if not os.path.isfile(chromedriver_path):
        print(f"[AVISO] ChromeDriver não encontrado em '{chromedriver_path}'.")
        print("Por favor, baixe o ChromeDriver compatível com sua versão do Chrome e coloque nesta pasta:")
        print("https://chromedriver.chromium.org/downloads\n")
        input("Pressione Enter para continuar...")

    # Verifica chrome-for-test
    if not os.path.isfile(chrome_for_test_path):
        print(f"[AVISO] ChromeForTest não encontrado em '{chrome_for_test_path}'.")
        print("Será usado o Chrome instalado normalmente no sistema para os testes.\n")
        input("Pressione Enter para continuar...")

    return chromedriver_path, chrome_for_test_path

def main():
    verificar_drivers()
    ajustar_tamanho_terminal(120, 40)
    limpar_tela()
    mensagem_boas_vindas = """
===============================================
  Bem-vindo aos testes automatizados do SIAS!
==============================================
"""

    while True:
        suites_arquivos = listar_suites()
        suites_formatadas = [formatar_nome_suite(f) for f in suites_arquivos]
        
        escolha_suite = exibir_menu(
            lista=suites_formatadas,
            titulo="MENU PRINCIPAL - SELECIONE UMA SUÍTE",
            mensagem_inicial=mensagem_boas_vindas
        )
        if escolha_suite == 0:
            print("Saindo.")
            break
        elif 1 <= escolha_suite <= len(suites_arquivos):
            suite_arquivo = suites_arquivos[escolha_suite - 1]
            suite_path = os.path.join(pasta_testes, suite_arquivo)
            while True:
                cenarios = listar_cenarios(suite_path)
                escolha_cenario = exibir_menu(
                    cenarios,
                    titulo=f"CENÁRIOS EM: {formatar_nome_suite(suite_arquivo)}",
                    incluir_sair=False,
                    incluir_voltar=True
                )
                if escolha_cenario == 0:
                    break
                elif 1 <= escolha_cenario <= len(cenarios):
                    nome_cenario = cenarios[escolha_cenario - 1]
                    executar_teste(nome_cenario, suite_arquivo)
                else:
                    print("Opção inválida. Tente novamente.")
        else:
            print("Opção inválida. Tente novamente.")

if __name__ == "__main__":
    main()