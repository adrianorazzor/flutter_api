defmodule FlutterApiWeb.PessoaController do
  use FlutterApiWeb, :controller

  # In-memory pessoa database for testing
  @pessoas [
    %{
      id: 1,
      fantasia: "Empresa A",
      codCidade: 1001,
      nome: "Empresa A Ltda",
      ruc: "7417343-0",
      endereco: "Rua Principal, 123",
      bairro: "Centro",
      telefone: "0985123456",
      email: "contato@empresaa.com",
      tipoPessoa: "juridica",
      categoriaVendedor: 0
    },
    %{
      id: 2,
      fantasia: "Empresa B",
      codCidade: 1002,
      nome: "Empresa B Ltda",
      ruc: "8765431-0",
      endereco: "Av. Secundária, 456",
      bairro: "Jardim",
      telefone: "0985567890",
      email: "contato@empresab.com",
      tipoPessoa: "juridica",
      categoriaVendedor: 0
    },
    %{
      id: 3,
      fantasia: "João Silva",
      codCidade: 1001,
      nome: "João da Silva",
      ruc: "1234567-0",
      endereco: "Rua das Flores, 789",
      bairro: "Vila Nova",
      telefone: "0981234567",
      email: "joao.silva@email.com",
      tipoPessoa: "fisica",
      categoriaVendedor: 0
    },
    %{
      id: 4,
      fantasia: "Maria Santos",
      codCidade: 1003,
      nome: "Maria dos Santos",
      ruc: "4455566-0",
      endereco: "Av. Central, 1010",
      bairro: "Boa Vista",
      telefone: "0982345678",
      email: "maria.santos@email.com",
      tipoPessoa: "fisica",
      categoriaVendedor: 0
    },
    %{
      id: 5,
      fantasia: "Empresa C",
      codCidade: 1002,
      nome: "Empresa C S.A.",
      ruc: "9876543-0",
      endereco: "Rua Comercial, 222",
      bairro: "Setor Industrial",
      telefone: "0985123456",
      email: "contato@empresac.com",
      tipoPessoa: "juridica",
      categoriaVendedor: 0
    }
  ]

  def index(conn, params) do
    # Extract pagination parameters with defaults
    size = Map.get(params, "size", "10") |> String.to_integer()
    sort_by = Map.get(params, "sortBy", "id")
    asc = Map.get(params, "asc", "true") == "true"

    # Sort the pessoas based on parameters
    sorted_pessoas = sort_pessoas(@pessoas, sort_by, asc)

    # Apply pagination (limit to size)
    paginated_pessoas = Enum.take(sorted_pessoas, size)

    conn
    |> put_status(:ok)
    |> json(paginated_pessoas)
  end

  defp sort_pessoas(pessoas, "id", asc) do
    if asc do
      Enum.sort_by(pessoas, & &1.id)
    else
      Enum.sort_by(pessoas, & &1.id, :desc)
    end
  end

  defp sort_pessoas(pessoas, "nome", asc) do
    if asc do
      Enum.sort_by(pessoas, & &1.nome)
    else
      Enum.sort_by(pessoas, & &1.nome, :desc)
    end
  end

  defp sort_pessoas(pessoas, _, asc) do
    # Default to sorting by id
    sort_pessoas(pessoas, "id", asc)
  end
end
