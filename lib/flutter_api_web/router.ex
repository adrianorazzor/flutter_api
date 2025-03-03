defmodule FlutterApiWeb.Router do
  use FlutterApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FlutterApiWeb do
    pipe_through :api

    post "/login", AuthControllerSimple, :login
    get "/pessoa", PessoaController, :index
    get "/cidade", CidadeController, :index
    get "/cidade/:id", CidadeController, :show
    
    # Item (Produto) endpoints
    get "/item", ItemController, :index
    get "/item/porDepositoDoUsuario", ItemController, :por_deposito_do_usuario
    get "/item/:id", ItemController, :show
    
    # Forma de Recebimento endpoints
    get "/formaDeRecebimento", FormaDeRecebimentoController, :index
    get "/formaDeRecebimento/:id", FormaDeRecebimentoController, :show
    
    # Nota Emitida endpoints
    get "/notaEmitida", NotaEmitidaController, :index
    get "/notaEmitida/vendasporvendedor/:id", NotaEmitidaController, :vendas_por_vendedor
    get "/notaEmitida/:id", NotaEmitidaController, :show
    post "/notaEmitida", NotaEmitidaController, :create
  end
end
