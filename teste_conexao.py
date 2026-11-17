
from database.conexao import conectar

conexao = None

try:
    conexao = conectar()

    if conexao.is_connected():
        print("Conexão com MySQL realizada com sucesso!")

except Exception as erro:
    print("Não foi possível conectar ao MySQL.")
    print("Erro:", erro)

finally:
    if conexao is not None and conexao.is_connected():
        conexao.close()
        print("Conexão encerrada.")



