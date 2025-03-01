defmodule FlutterApiWeb.AuthControllerSimple do
  use FlutterApiWeb, :controller

  # In-memory user database for testing
  @users [
    %{
      id: 1,
      email: "test@example.com",
      password: "password123",
      pessoa_id: 1
    }
  ]

  def login(conn, %{"email" => email, "senha" => password}) do
    case authenticate_user(email, password) do
      {:ok, user} ->
        token = generate_token(user)

        conn
        |> put_resp_header("authorization", token)
        |> json(%{
          "usuario_id" => user.id,
          "pessoa_id" => user.pessoa_id
        })

      {:error, _reason} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "unauthorized", message: "Invalid email or password"})
    end
  end

  defp authenticate_user(email, password) do
    user = Enum.find(@users, fn u -> u.email == email end)
    
    if user && user.password == password do
      {:ok, user}
    else
      {:error, :invalid_credentials}
    end
  end

  # Simple token generation for testing purposes
  defp generate_token(user) do
    "Bearer " <> Base.encode64("#{user.id}:#{user.email}:#{:os.system_time(:seconds)}")
  end
end
