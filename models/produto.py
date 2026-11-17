
class Produto:
    def __init__(self, nome, preco, id_categoria, id_agente, id_item=None):
        self.id_item = id_item
        self.nome = nome
        self.preco = preco
        self.id_categoria = id_categoria
        self.id_agente = id_agente
