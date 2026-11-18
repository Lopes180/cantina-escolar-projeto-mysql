
import customtkinter as ctk
from tkinter import messagebox


class ProdutoView:

    def __init__(self, controller):
        self.controller = controller

        
        self.janela = ctk.CTk()
        self.janela.title("Cantina Escolar")
        self.janela.geometry("800x600")

        
        self.titulo = ctk.CTkLabel(
            self.janela,
            text="Gerenciamento de Produtos",
            font=("Arial", 24, "bold")
        )
        self.titulo.pack(pady=20)

        
        self.campo_nome = ctk.CTkEntry(
            self.janela,
            placeholder_text="Nome do produto",
            width=300
        )
        self.campo_nome.pack(pady=10)

        
        self.campo_preco = ctk.CTkEntry(
            self.janela,
            placeholder_text="Preço do produto",
            width=300
        )
        self.campo_preco.pack(pady=10)

        
        self.campo_categoria = ctk.CTkEntry(
            self.janela,
            placeholder_text="ID da categoria",
            width=300
        )
        self.campo_categoria.pack(pady=10)

        
        self.campo_agente = ctk.CTkEntry(
            self.janela,
            placeholder_text="ID do agente",
            width=300
        )
        self.campo_agente.pack(pady=10)

        
        self.botao_cadastrar = ctk.CTkButton(
            self.janela,
            text="Cadastrar produto",
            command=self.cadastrar_produto
        )
        self.botao_cadastrar.pack(pady=20)

        self.campo_id = ctk.CTkEntry(
            self.janela,
            placeholder_text="ID do produto para atualizar",
            width=300
        )
        self.campo_id.pack(pady=10)

        self.botao_atualizar = ctk.CTkButton(
            self.janela,
            text="Atualizar produto",
            command=self.atualizar_produto
        )
        self.botao_atualizar.pack(pady=10)

        self.campo_id_excluir = ctk.CTkEntry(
            self.janela,
            placeholder_text="ID do produto para excluir",
            width=300
        )
        self.campo_id_excluir.pack(pady=10)

        self.botao_excluir = ctk.CTkButton(
            self.janela,
            text="Excluir produto",
            command=self.excluir_produto
        )
        self.botao_excluir.pack(pady=10)

        self.titulo_lista = ctk.CTkLabel(
            self.janela,
            text="Produtos cadastrados",
            font=("Arial", 18, "bold")
        )
        self.titulo_lista.pack(pady=10)

        
        self.lista_produtos = ctk.CTkScrollableFrame(
            self.janela,
            width=500,
            height=200
        )
        self.lista_produtos.pack(pady=10)

        
        self.listar_produtos()

    
    def cadastrar_produto(self):


        nome = self.campo_nome.get()
        preco = self.campo_preco.get()
        categoria = self.campo_categoria.get()
        agente = self.campo_agente.get()

        try:
            preco = float(preco)
            categoria = int(categoria)
            agente = int(agente)

            self.controller.cadastrar_produto(
                nome,
                preco,
                categoria,
                agente
            )

            messagebox.showinfo(
                "Sucesso",
                "Produto cadastrado com sucesso!"
            )

            
            self.campo_nome.delete(0, "end")
            self.campo_preco.delete(0, "end")
            self.campo_categoria.delete(0, "end")
            self.campo_agente.delete(0, "end")

            
            self.listar_produtos()

        except ValueError as erro:
            messagebox.showerror(
                "Dados inválidos",
                str(erro)
            )

        except Exception as erro:
            print("Erro técnico:", erro)

            messagebox.showerror(
                "Erro",
                "Não foi possível cadastrar o produto."
            )

    def atualizar_produto(self):

        try:
            id_item = int(self.campo_id.get())

            nome = self.campo_nome.get()
            preco = float(self.campo_preco.get())
            categoria = int(self.campo_categoria.get())
            agente = int(self.campo_agente.get())

            self.controller.atualizar_produto(
                id_item,
                nome,
                preco,
                categoria,
                agente
            )

            messagebox.showinfo(
                "Sucesso",
                "Produto atualizado com sucesso!"
            )

            self.campo_id.delete(0, "end")
            self.campo_nome.delete(0, "end")
            self.campo_preco.delete(0, "end")
            self.campo_categoria.delete(0, "end")
            self.campo_agente.delete(0, "end")

            self.listar_produtos()

        except ValueError as erro:
            messagebox.showerror(
                "Dados inválidos",
                str(erro)
            )

        except Exception as erro:
            print("Erro técnico:", erro)

            messagebox.showerror(
                "Erro",
                "Não foi possível atualizar o produto."
            )

    
    
    def excluir_produto(self):

        try:
            id_item = int(self.campo_id_excluir.get())

           
            confirmar = messagebox.askyesno(
                "Confirmar exclusão",
                "Tem certeza que deseja excluir este produto?"
            )

            if confirmar:

                self.controller.excluir_produto(id_item)

                messagebox.showinfo(
                    "Sucesso",
                    "Produto excluído com sucesso!"
                )

                
                self.campo_id_excluir.delete(0, "end")

                
                self.listar_produtos()

        except ValueError as erro:
            messagebox.showerror(
                "Dados inválidos",
                str(erro)
            )

        except Exception as erro:
            print("Erro técnico:", erro)

            messagebox.showerror(
                "Erro",
                "Não foi possível excluir o produto."
            )


    
    def listar_produtos(self):

        try:
            
            produtos = self.controller.listar_produtos()

            
            for widget in self.lista_produtos.winfo_children():
                widget.destroy()

            
            for produto in produtos:

                texto = (
                    f"ID: {produto.id_item} | "
                    f"{produto.nome} | "
                    f"R$ {produto.preco}"
                )

                label = ctk.CTkLabel(
                    self.lista_produtos,
                    text=texto
                )

                label.pack(pady=5)

        except Exception as erro:
            print("Erro técnico:", erro)

            messagebox.showerror(
                "Erro",
                "Não foi possível carregar os produtos."
            )

    
    def iniciar(self):
        self.janela.mainloop()
