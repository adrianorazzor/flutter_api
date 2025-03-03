defmodule FlutterApiWeb.ItemController do
  use FlutterApiWeb, :controller

  # In-memory produto database for testing
  @produtos [
    %{
      id: 1,
      nome: "Notebook Dell XPS 13",
      barras: "7891234567890",
      preco: 5999.99,
      precoMinimo: 5499.99,
      custoMedio: 4500.00,
      ultimoCusto: 4600.00,
      saldo: 15.0,
      ativo: 1,
      nome_grupo: "Informática",
      nome_marca: "Dell",
      link_icone_img: "https://example.com/images/dell-xps.jpg"
    },
    %{
      id: 2,
      nome: "Smartphone Samsung Galaxy S21",
      barras: "7892345678901",
      preco: 3999.99,
      precoMinimo: 3699.99,
      custoMedio: 2800.00,
      ultimoCusto: 2900.00,
      saldo: 23.0,
      ativo: 1,
      nome_grupo: "Celulares",
      nome_marca: "Samsung",
      link_icone_img: "https://example.com/images/samsung-s21.jpg"
    },
    %{
      id: 3,
      nome: "Smart TV LG 55 polegadas",
      barras: "7893456789012",
      preco: 4299.99,
      precoMinimo: 3999.99,
      custoMedio: 3200.00,
      ultimoCusto: 3300.00,
      saldo: 8.0,
      ativo: 1,
      nome_grupo: "Televisores",
      nome_marca: "LG",
      link_icone_img: "https://example.com/images/lg-tv.jpg"
    },
    %{
      id: 4,
      nome: "Fone de Ouvido JBL Tune 500BT",
      barras: "7894567890123",
      preco: 299.99,
      precoMinimo: 249.99,
      custoMedio: 180.00,
      ultimoCusto: 190.00,
      saldo: 45.0,
      ativo: 1,
      nome_grupo: "Áudio",
      nome_marca: "JBL",
      link_icone_img: "https://example.com/images/jbl-tune.jpg"
    },
    %{
      id: 5,
      nome: "Console PlayStation 5",
      barras: "7895678901234",
      preco: 4499.99,
      precoMinimo: 4299.99,
      custoMedio: 3800.00,
      ultimoCusto: 3850.00,
      saldo: 5.0,
      ativo: 1,
      nome_grupo: "Games",
      nome_marca: "Sony",
      link_icone_img: "https://example.com/images/ps5.jpg"
    },
    %{
      id: 6,
      nome: "Cafeteira Elétrica Philips Walita",
      barras: "7896789012345",
      preco: 249.99,
      precoMinimo: 199.99,
      custoMedio: 150.00,
      ultimoCusto: 155.00,
      saldo: 30.0,
      ativo: 1,
      nome_grupo: "Eletrodomésticos",
      nome_marca: "Philips",
      link_icone_img: "https://example.com/images/philips-cafeteira.jpg"
    },
    %{
      id: 7,
      nome: "Tênis Nike Air Max",
      barras: "7897890123456",
      preco: 699.99,
      precoMinimo: 599.99,
      custoMedio: 450.00,
      ultimoCusto: 470.00,
      saldo: 18.0,
      ativo: 1,
      nome_grupo: "Calçados",
      nome_marca: "Nike",
      link_icone_img: "https://example.com/images/nike-airmax.jpg"
    },
    %{
      id: 8,
      nome: "Geladeira Brastemp Frost Free",
      barras: "7898901234567",
      preco: 3299.99,
      precoMinimo: 2999.99,
      custoMedio: 2500.00,
      ultimoCusto: 2550.00,
      saldo: 7.0,
      ativo: 1,
      nome_grupo: "Eletrodomésticos",
      nome_marca: "Brastemp",
      link_icone_img: "https://example.com/images/brastemp-geladeira.jpg"
    },
    %{
      id: 9,
      nome: "Câmera Canon EOS Rebel T7",
      barras: "7899012345678",
      preco: 2499.99,
      precoMinimo: 2299.99,
      custoMedio: 1900.00,
      ultimoCusto: 1950.00,
      saldo: 12.0,
      ativo: 1,
      nome_grupo: "Fotografia",
      nome_marca: "Canon",
      link_icone_img: "https://example.com/images/canon-eos.jpg"
    },
    %{
      id: 10,
      nome: "Mochila Adidas",
      barras: "7890123456789",
      preco: 199.99,
      precoMinimo: 169.99,
      custoMedio: 120.00,
      ultimoCusto: 125.00,
      saldo: 40.0,
      ativo: 1,
      nome_grupo: "Acessórios",
      nome_marca: "Adidas",
      link_icone_img: "https://example.com/images/adidas-mochila.jpg"
    },
    %{
      id: 11,
      nome: "Impressora HP LaserJet",
      barras: "7891234567891",
      preco: 1299.99,
      precoMinimo: 1199.99,
      custoMedio: 950.00,
      ultimoCusto: 980.00,
      saldo: 9.0,
      ativo: 0,
      nome_grupo: "Informática",
      nome_marca: "HP",
      link_icone_img: "https://example.com/images/hp-laserjet.jpg"
    },
    %{
      id: 12,
      nome: "Relógio Apple Watch Series 7",
      barras: "7892345678902",
      preco: 3499.99,
      precoMinimo: 3299.99,
      custoMedio: 2800.00,
      ultimoCusto: 2850.00,
      saldo: 14.0,
      ativo: 1,
      nome_grupo: "Smartwatches",
      nome_marca: "Apple",
      link_icone_img: "https://example.com/images/apple-watch.jpg"
    }
  ]

  def index(conn, params) do
    # Extract pagination parameters with defaults
    size = Map.get(params, "size", "10") |> String.to_integer()
    sort_by = Map.get(params, "sortBy", "id")
    asc = Map.get(params, "asc", "true") == "true"
    
    # Sort the produtos based on parameters
    sorted_produtos = sort_produtos(@produtos, sort_by, asc)
    
    # Apply pagination (limit to size)
    paginated_produtos = Enum.take(sorted_produtos, size)
    
    conn
    |> put_status(:ok)
    |> json(paginated_produtos)
  end

  def por_deposito_do_usuario(conn, params) do
    # This endpoint simulates fetching products by user's deposit
    # For testing purposes, it returns the same products as the index endpoint
    
    # Extract pagination parameters with defaults
    size = Map.get(params, "size", "10") |> String.to_integer()
    sort_by = Map.get(params, "sortBy", "id")
    asc = Map.get(params, "asc", "true") == "true"
    
    # Sort the produtos based on parameters
    sorted_produtos = sort_produtos(@produtos, sort_by, asc)
    
    # Apply pagination (limit to size)
    paginated_produtos = Enum.take(sorted_produtos, size)
    
    conn
    |> put_status(:ok)
    |> json(paginated_produtos)
  end

  def show(conn, %{"id" => id}) do
    # Convert id to integer
    id_int = String.to_integer(id)
    
    # Find produto by id
    case Enum.find(@produtos, fn p -> p.id == id_int end) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Produto not found"})
      
      produto ->
        conn
        |> put_status(:ok)
        |> json(produto)
    end
  end

  defp sort_produtos(produtos, "id", asc) do
    if asc do
      Enum.sort_by(produtos, & &1.id)
    else
      Enum.sort_by(produtos, & &1.id, :desc)
    end
  end

  defp sort_produtos(produtos, "nome", asc) do
    if asc do
      Enum.sort_by(produtos, & &1.nome)
    else
      Enum.sort_by(produtos, & &1.nome, :desc)
    end
  end

  defp sort_produtos(produtos, "preco", asc) do
    if asc do
      Enum.sort_by(produtos, & &1.preco)
    else
      Enum.sort_by(produtos, & &1.preco, :desc)
    end
  end

  defp sort_produtos(produtos, _, asc) do
    # Default to sorting by id
    sort_produtos(produtos, "id", asc)
  end
end
