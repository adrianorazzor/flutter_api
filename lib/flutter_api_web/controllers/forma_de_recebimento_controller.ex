defmodule FlutterApiWeb.FormaDeRecebimentoController do
  use FlutterApiWeb, :controller

  # In-memory forma de recebimento database for testing
  @formas_de_recebimento [
    %{
      id: 1,
      nome: "Dinheiro à Vista",
      formaPadraoDeEntrada: "dinheiro",
      condicaoDeVenda: "avista"
    },
    %{
      id: 2,
      nome: "Cartão de Crédito",
      formaPadraoDeEntrada: "cartao",
      condicaoDeVenda: "avista"
    },
    %{
      id: 3,
      nome: "Cartão de Débito",
      formaPadraoDeEntrada: "cartao",
      condicaoDeVenda: "avista"
    },
    %{
      id: 4,
      nome: "Crédito à Prazo",
      formaPadraoDeEntrada: "credito",
      condicaoDeVenda: "aprazo"
    },
    %{
      id: 5,
      nome: "Boleto Bancário",
      formaPadraoDeEntrada: "lancamento",
      condicaoDeVenda: "aprazo"
    },
    %{
      id: 6,
      nome: "Transferência Bancária",
      formaPadraoDeEntrada: "lancamento",
      condicaoDeVenda: "avista"
    },
    %{
      id: 7,
      nome: "PIX",
      formaPadraoDeEntrada: "dinheiro",
      condicaoDeVenda: "avista"
    },
    %{
      id: 8,
      nome: "Cheque à Vista",
      formaPadraoDeEntrada: "dinheiro",
      condicaoDeVenda: "avista"
    },
    %{
      id: 9,
      nome: "Cheque à Prazo",
      formaPadraoDeEntrada: "lancamento",
      condicaoDeVenda: "aprazo"
    }
  ]

  def index(conn, params) do
    # Extract pagination parameters with defaults
    size = Map.get(params, "size", "10") |> String.to_integer()
    sort_by = Map.get(params, "sortBy", "id")
    asc = Map.get(params, "asc", "true") == "true"
    
    # Sort the formas_de_recebimento based on parameters
    sorted_formas = sort_formas(@formas_de_recebimento, sort_by, asc)
    
    # Apply pagination (limit to size)
    paginated_formas = Enum.take(sorted_formas, size)
    
    conn
    |> put_status(:ok)
    |> json(paginated_formas)
  end

  def show(conn, %{"id" => id}) do
    # Convert id to integer
    id_int = String.to_integer(id)
    
    # Find forma de recebimento by id
    case Enum.find(@formas_de_recebimento, fn f -> f.id == id_int end) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Forma de recebimento not found"})
      
      forma ->
        conn
        |> put_status(:ok)
        |> json(forma)
    end
  end

  defp sort_formas(formas, "id", asc) do
    if asc do
      Enum.sort_by(formas, & &1.id)
    else
      Enum.sort_by(formas, & &1.id, :desc)
    end
  end

  defp sort_formas(formas, "nome", asc) do
    if asc do
      Enum.sort_by(formas, & &1.nome)
    else
      Enum.sort_by(formas, & &1.nome, :desc)
    end
  end

  defp sort_formas(formas, _, asc) do
    # Default to sorting by id
    sort_formas(formas, "id", asc)
  end
end
