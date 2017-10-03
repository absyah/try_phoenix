defmodule TryPhoenix.EngineersController do
  use TryPhoenix.Web, :controller

  def index(conn, _params) do
    engineers = TryPhoenix.Repo.all(TryPhoenix.Engineer)

    render conn, "index.html", engineers: engineers 
  end
end
