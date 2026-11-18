
from repositories.produto_repository import ProdutoRepository
from models.produto import Produto


class ProdutoController:

    def __init__(self):
        self.repository = ProdutoRepository()

    
    def validar_produto(self, nome, preco, id_categoria, id_agente):

        if not isinstance(nome, str) or not nome.strip():
            raise ValueError("O nome do produto é obrigatório.")

        if len(nome.strip()) > 100:
            raise ValueError("O nome deve ter no máximo 100 caracteres.")

        if isinstance(preco, bool) or not isinstance(preco, (int, float)):
            raise ValueError("O preço deve ser numérico.")

        if preco <= 0:
            raise ValueError("O preço deve ser maior que zero.")

        if not isinstance(id_categoria, int) or id_categoria <= 0:
            raise ValueError("A categoria informada é inválida.")

        if not isinstance(id_agente, int) or id_agente <= 0:
            raise ValueError("O agente informado é inválido.")

        return True

    
    def listar_produtos(self):
        return self.repository.listar_todos()

    
    def cadastrar_produto(self, nome, preco, id_categoria, id_agente):

        self.validar_produto(nome, preco, id_categoria, id_agente)

        produto = Produto(
            nome=nome.strip(),
            preco=preco,
            id_categoria=id_categoria,
            id_agente=id_agente
        )

        self.repository.cadastrar(produto)

        return True

    
    def atualizar_produto(self, id_item, nome, preco, id_categoria, id_agente):

        if not isinstance(id_item, int) or id_item <= 0:
            raise ValueError("ID do produto inválido.")

        self.validar_produto(nome, preco, id_categoria, id_agente)

        produto = Produto(
            nome=nome.strip(),
            preco=preco,
            id_categoria=id_categoria,
            id_agente=id_agente,
            id_item=id_item
        )

        self.repository.atualizar(produto)

        return True

    
    def excluir_produto(self, id_item):

        if not isinstance(id_item, int) or id_item <= 0:
            raise ValueError("ID do produto inválido.")

        self.repository.excluir(id_item)

        return True

