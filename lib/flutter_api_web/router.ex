defmodule FlutterApiWeb.Router do
  use FlutterApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FlutterApiWeb do
    pipe_through :api
  end
end
