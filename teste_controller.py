
from controllers.produto_controller import ProdutoController

controller = ProdutoController()

try:
    produtos = controller.listar_produtos()

    print("Produtos encontrados:", len(produtos))
    print("-" * 50)

    for produto in produtos:
        print(
            produto.id_item,
            produto.nome,
            produto.preco,
            produto.id_categoria,
            produto.id_agente
        )

except Exception as erro:
    print("Erro ao listar produtos:", erro)
