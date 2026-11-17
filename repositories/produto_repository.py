
from database.conexao import conectar
from models.produto import Produto


class ProdutoRepository:

    
    def listar_todos(self):
        conexao = conectar()
        cursor = None

        try:
            cursor = conexao.cursor()

            sql = """
                SELECT id_item, nome, preco, id_categoria, id_agente
                FROM item_cardapio
            """

            cursor.execute(sql)
            resultados = cursor.fetchall()

            produtos = []

            for item in resultados:
                produto = Produto(
                    id_item=item[0],
                    nome=item[1],
                    preco=item[2],
                    id_categoria=item[3],
                    id_agente=item[4]
                )

                produtos.append(produto)

            return produtos

        finally:
            if cursor is not None:
                cursor.close()

            conexao.close()

    
    def cadastrar(self, produto):
        conexao = conectar()
        cursor = None

        try:
            cursor = conexao.cursor()

            sql = """
                INSERT INTO item_cardapio
                (nome, preco, id_categoria, id_agente)
                VALUES (%s, %s, %s, %s)
            """

            valores = (
                produto.nome,
                produto.preco,
                produto.id_categoria,
                produto.id_agente
            )

            cursor.execute(sql, valores)
            conexao.commit()

        except Exception:
            conexao.rollback()
            raise

        finally:
            if cursor is not None:
                cursor.close()

            conexao.close()

    
    def atualizar(self, produto):
        conexao = conectar()
        cursor = None

        try:
            cursor = conexao.cursor()

            sql = """
                UPDATE item_cardapio
                SET nome = %s,
                    preco = %s,
                    id_categoria = %s,
                    id_agente = %s
                WHERE id_item = %s
            """

            valores = (
                produto.nome,
                produto.preco,
                produto.id_categoria,
                produto.id_agente,
                produto.id_item
            )

            cursor.execute(sql, valores)
            conexao.commit()

        except Exception:
            conexao.rollback()
            raise

        finally:
            if cursor is not None:
                cursor.close()

            conexao.close()

    
    def excluir(self, id_item):
        conexao = conectar()
        cursor = None

        try:
            cursor = conexao.cursor()

            sql = """
                DELETE FROM item_cardapio
                WHERE id_item = %s
            """

            valores = (id_item,)

            cursor.execute(sql, valores)
            conexao.commit()

        except Exception:
            conexao.rollback()
            raise

        finally:
            if cursor is not None:
                cursor.close()

            conexao.close()
