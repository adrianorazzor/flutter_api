defmodule FlutterApi.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias FlutterApi.Repo
  alias FlutterApi.Accounts.User

  @doc """
  Gets a user by email and password.
  """
  def get_user_by_email_and_password(email, password) when is_binary(email) and is_binary(password) do
    user = Repo.get_by(User, email: email)
    if user && verify_password(password, user.password_hash) do
      user
    else
      nil
    end
  end

  # Simple password verification for testing purposes
  defp verify_password(password, stored_hash) do
    hash = :crypto.hash(:sha256, password) |> Base.encode64()
    hash == stored_hash
  end

  @doc """
  Creates a user.
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Gets a single user.
  """
  def get_user!(id), do: Repo.get!(User, id)
end
