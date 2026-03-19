# Gera dados de paciente baseado no CPF fornecido. 
# Retorna um dicionário com todos os campos.

def gerar_nomes(cpf, tipo_usuario):

    # Pega últimos 4 dígitos para criar um ID único
    id_unico = cpf[-6:-2].replace(".", "").replace("-", "")

    nome = tipo_usuario
    sobrenome = f"Teste{id_unico}"
    nome_social = f"{nome} {sobrenome}"
    nome_da_mae = f"Mãe do {nome}"
    nome_do_logradouro = f"Rua do {nome} {sobrenome}"
    numero_da_rua = id_unico
    nome_do_bairro = f"Bairro do {nome} {id_unico}"

    usuario = {
        "nome": nome,
        "sobrenome": sobrenome,
        "nome_social": nome_social,
        "nome_mae": nome_da_mae,
        "logradouro": nome_do_logradouro,
        "numero": numero_da_rua,
        "bairro": nome_do_bairro
    }

    return usuario

# Função que o Robot pode chamar
def get_next_dados(cpf, tipo_usuario):
    return gerar_nomes(cpf, tipo_usuario)