import random

def gerar_cpf():
    # gera 9 dígitos iniciais
    cpf = [random.randint(0, 9) for _ in range(9)]

    # calcula o 1º dígito verificador
    soma = sum((10 - i) * num for i, num in enumerate(cpf))
    resto = (soma * 10) % 11
    cpf.append(0 if resto == 10 else resto)

    # calcula o 2º dígito verificador
    soma = sum((11 - i) * num for i, num in enumerate(cpf))
    resto = (soma * 10) % 11
    cpf.append(0 if resto == 10 else resto)

    # retorna formatado
    return f"{cpf[0]}{cpf[1]}{cpf[2]}.{cpf[3]}{cpf[4]}{cpf[5]}.{cpf[6]}{cpf[7]}{cpf[8]}-{cpf[9]}{cpf[10]}"


# Função que o Robot pode chamar
def get_next_cpf():
    return gerar_cpf()