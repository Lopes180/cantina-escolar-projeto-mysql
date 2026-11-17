from controllers.produto_controller import ProdutoController

controller = ProdutoController()

try:
    resultado = controller.cadastrar_produto(
        nome="Coxinha teste",
        preco=7.50,
        id_categoria=2,
        id_agente=1
    )

    print("Produto cadastrado com sucesso!")

except Exception as erro:
    print("Erro ao cadastrar:", erro)