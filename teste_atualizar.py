from controllers.produto_controller import ProdutoController

controller = ProdutoController()

try:
    controller.atualizar_produto(
        id_item=17,
        nome="Coxinha teste",
        preco=8.00,
        id_categoria=2,
        id_agente=1
    )

    print("Produto atualizado com sucesso!")

except Exception as erro:
    print("Erro ao atualizar:", erro)