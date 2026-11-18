from controllers.produto_controller import ProdutoController
from views.produto_view import ProdutoView


controller = ProdutoController()

view = ProdutoView(controller)

view.iniciar()