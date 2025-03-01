defmodule FlutterApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :pessoa_id, :integer

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :pessoa_id])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces")
    |> validate_length(:password, min: 6, message: "should be at least 6 characters")
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    # Simple password hashing for testing purposes
    hash = :crypto.hash(:sha256, password) |> Base.encode64()
    change(changeset, password_hash: hash)
  end

  defp put_password_hash(changeset), do: changeset
end
