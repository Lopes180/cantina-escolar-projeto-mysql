from repositories.produto_repository import ProdutoRepository

repository = ProdutoRepository()

produtos = repository.listar_todos()

for produto in produtos:
    print(
        produto.id_item,
        produto.nome,
        produto.preco,
        produto.id_categoria,
        produto.id_agente
    )