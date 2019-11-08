class ProdutosController < ApplicationController

    def index
        @produtos = Produto.order(name: :asc).limit 5
        @produto_com_desconto = Produto.order(:price).limit 1
    end

    def create 
        produto = params.require(:produto).permit(:name, :description, :price, :quantity)
        Produto.create produto
        redirect_to root_path
    end

    def destroy 
        id = params[:id]
        Produto.destroy id
        redirect_to root_path
    end

    def busca
        name = params[:name]
        @produtos = Produto.where "name like ?", "%#{name}%"
    end

end
