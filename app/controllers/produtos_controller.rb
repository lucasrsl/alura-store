class ProdutosController < ApplicationController

    before_action :set_produto, only: [:edit, :update, :destroy]

    def index
        @produtos = Produto.order(name: :asc).limit 6
        @produto_com_desconto = Produto.order(:price).limit 1
    end

    def create 
        @produto = Produto.new produto_params
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso!"
            redirect_to root_path
        else
            renderiza :new
        end
    end

    def destroy 
        @produto.destroy
        redirect_to root_path
    end

    def busca
        name = params[:name]
        @produtos = Produto.where "name like ?", "%#{name}%"
    end

    def new
        @produto = Produto.new
        @departamentos = Departamento.all
    end

    def edit
        renderiza :edit
    end

    def update
        if @produto.update produto_params
            flash[:notice] = "Produto atualizado com sucesso"
            redirect_to root_url
        else
            renderiza :edit
        end
    end

    def produto_params
        params.require(:produto).permit(:name, :description, :price, :quantity, :departamento_id)
    end

    def set_produto
        @produto = Produto.find(params[:id])
    end

    def renderiza(view)
        @departamentos = Departamento.all
        render view
    end


end
