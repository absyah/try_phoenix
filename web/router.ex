defmodule TryPhoenix.Router do
  use TryPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TryPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/engineers", EngineersController, :index
    get "/engineers/new", EngineersController, :new
    post "/engineers", EngineersController, :create
    get "/engineers/:id", EngineersController, :show, as: :engineer
    get "/engineers/:id/edit", EngineersController, :edit, as: :engineer
    put "/engineers", EngineersController, :update, as: :engineer
  end

  # Other scopes may use custom stacks.
  # scope "/api", TryPhoenix do
  #   pipe_through :api
  # end
end
