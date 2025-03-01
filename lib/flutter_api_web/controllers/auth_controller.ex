defmodule FlutterApiWeb.AuthController do
  use FlutterApiWeb, :controller
  alias FlutterApi.Accounts

  def login(conn, %{"email" => email, "senha" => password}) do
    case Accounts.get_user_by_email_and_password(email, password) do
      nil ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "unauthorized", message: "Invalid email or password"})

      user ->
        token = generate_token(user)

        conn
        |> put_resp_header("authorization", token)
        |> json(%{
          "usuario_id" => user.id,
          "pessoa_id" => user.pessoa_id
        })
    end
  end

  # Simple token generation for testing purposes
  # In a real application, you would use a proper JWT library
  defp generate_token(user) do
    # This is a simplified example - use a proper JWT library in production
    "Bearer " <> Base.encode64("#{user.id}:#{user.email}:#{:os.system_time(:seconds)}")
  end
end
