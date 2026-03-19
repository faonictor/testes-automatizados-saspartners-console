import random

def gerador_email():

    # Gera alias de um e-mail.

    # Gera 5 dígitos aleatórios (entre 00000 e 99999)
    random_digits = ''.join([str(random.randint(0, 9)) for _ in range(5)])
    email = f"siastestesrobot+{random_digits}@gmail.com"
    return email

# Função que o Robot pode chamar
def get_next_email():
    return gerador_email()