defmodule FlutterApiWeb.Router do
  use FlutterApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FlutterApiWeb do
    pipe_through :api

    post "/login", AuthControllerSimple, :login
  end
end
