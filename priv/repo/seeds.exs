# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FlutterApi.Repo.insert!(%FlutterApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias FlutterApi.Accounts

# Create a test user
{:ok, _user} = Accounts.create_user(%{
  email: "test@example.com",
  password: "password123",
  pessoa_id: 1
})

IO.puts("Test user created successfully!")
