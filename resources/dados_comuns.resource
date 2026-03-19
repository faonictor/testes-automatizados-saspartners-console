*** Variables ***
### Links e Ambientes ###
${google}                           https://www.google.com.br
${devParceiros}                     https://devsiasparceiros.sassmart.com.br/authentication/login
${div_header}                       xpath://header//div[@id='navbarSupportedContent' and contains(@class, 'navbar-collapse')]

### Acessos Administrador
${usuario_joao}                     10884607470
${senha_joao}                       Smart*01
${usuario_admin}                    05641008460
${senha_admin}                      Smart10*

### Usuário com Acesso MEMED
${usuario_memed_feminino}           42791798080
${usuario_memed}                    50720695082
${senha_memed}                      Smart10*

### Acesso Perfil Médico
${usuario_profissional}             10884607470 //Mudar

### Acesso Perfil Paciente - Paciente Partners 01
${usuario_paciente}                 63560946050

### Senha Padrão Teste
${senha_padrao}                     Smart10*

### Dados de Cadastro Paciente Estáticos ###
${paciente_nascimento}              15/06/2000
${paciente_ddd}                     87
${paciente_telefone}                998098223
${paciente_cns}                     962561831340006
${etnia}                            Negro
${cep}                              56800-000
${complemento}                      Apto 01
${observacao}                       Observação do Paciente
${unidade_atendimento}              SMART

### Pacientes para Agendamento e Falta
${paciente_feminino_cpf}            903.501.660-21
${paciente_masculino_cpf}           350.191.010-01
${paciente_naoinformar_cpf}         709.621.610-39

### Pacientes para Teste de Anexo
${paciente_01}                      635.609.460-50
${paciente_02}                      237.154.600-32
${paciente_03}                      656.859.860-76
${paciente_04}                      772.381.260-44
${paciente_05}                      350.191.010-01

### Temporizadores
${tempo_pausa}                      1s
${tempo_minimo}                     2s
${tempo_elemento}                   5s
${tempo_padrao}                     10s
${tempo_maximo}                     30s

### Eixos
${dias}                             10
${valor}                            10
${para_cima}                        -280
${para_baixo}                       0

### Tipos de Usuários
${tipo_paciente}                    Paciente
${tipo_profissional}                Profissional

### Relatórios
${5_dias}                           5
${7_dias}                           7
${10_dias}                          10
${15_dias}                          15