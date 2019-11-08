Rails.application.routes.draw do
  root to: "produtos#index"
  resources :produtos, only: [:new, :create, :destroy]
  get "produtos/busca", to: "produtos#busca", as: :busca_produto
end
