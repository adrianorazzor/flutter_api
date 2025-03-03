defmodule FlutterApiWeb.CidadeController do
  use FlutterApiWeb, :controller

  # In-memory cidade database for testing
  # IDs match the codCidade values in PessoaController
  @cidades [
    %{
      id: 1001,
      nome: "Asunción",
      codigoLocalidadeNFe: "ASU",
      codigoDistritoNFe: "01"
    },
    %{
      id: 1002,
      nome: "Ciudad del Este",
      codigoLocalidadeNFe: "CDE",
      codigoDistritoNFe: "10"
    },
    %{
      id: 1003,
      nome: "Encarnación",
      codigoLocalidadeNFe: "ENC",
      codigoDistritoNFe: "05"
    },
    %{
      id: 1004,
      nome: "San Lorenzo",
      codigoLocalidadeNFe: "SLO",
      codigoDistritoNFe: "11"
    },
    %{
      id: 1005,
      nome: "Luque",
      codigoLocalidadeNFe: "LUQ",
      codigoDistritoNFe: "06"
    }
  ]

  def index(conn, params) do
    # Extract pagination parameters with defaults
    size = Map.get(params, "size", "10") |> String.to_integer()
    sort_by = Map.get(params, "sortBy", "id")
    asc = Map.get(params, "asc", "true") == "true"
    
    # Sort the cidades based on parameters
    sorted_cidades = sort_cidades(@cidades, sort_by, asc)
    
    # Apply pagination (limit to size)
    paginated_cidades = Enum.take(sorted_cidades, size)
    
    conn
    |> put_status(:ok)
    |> json(paginated_cidades)
  end

  def show(conn, %{"id" => id}) do
    # Convert id to integer
    id_int = String.to_integer(id)
    
    # Find cidade by id
    case Enum.find(@cidades, fn c -> c.id == id_int end) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Cidade not found"})
      
      cidade ->
        conn
        |> put_status(:ok)
        |> json(cidade)
    end
  end

  defp sort_cidades(cidades, "id", asc) do
    if asc do
      Enum.sort_by(cidades, & &1.id)
    else
      Enum.sort_by(cidades, & &1.id, :desc)
    end
  end

  defp sort_cidades(cidades, "nome", asc) do
    if asc do
      Enum.sort_by(cidades, & &1.nome)
    else
      Enum.sort_by(cidades, & &1.nome, :desc)
    end
  end

  defp sort_cidades(cidades, _, asc) do
    # Default to sorting by id
    sort_cidades(cidades, "id", asc)
  end
end
