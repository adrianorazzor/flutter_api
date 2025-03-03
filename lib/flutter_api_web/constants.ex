defmodule FlutterApiWeb.Constants do
  @moduledoc """
  Constants used throughout the API.
  """

  # API endpoint paths
  def api_endpoints do
    %{
      login: "/login",
      pessoa: "/pessoa",
      cidade: "/cidade",
      item: "/item",
      formaDeRecebimento: "/formaDeRecebimento"
    }
  end
end
