from controllers.produto_controller import ProdutoController

controller = ProdutoController()

try:
    controller.excluir_produto(
        id_item=17
    )

    print("Produto excluído com sucesso!")

except Exception as erro:
    print("Erro ao excluir:", erro)