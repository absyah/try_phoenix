defmodule TryPhoenix.EngineersController do
  use TryPhoenix.Web, :controller

  def index(conn, _params) do
    engineers = TryPhoenix.Repo.all(TryPhoenix.Engineer)

    render conn, "index.html", engineers: engineers 
  end

  def new(conn, _params) do
    engineer = %TryPhoenix.Engineer{name: "", email: "", phone: ""}

    render conn, "new.html", engineer: engineer
  end

  def create(conn, params) do
    engineer = %TryPhoenix.Engineer{
      name: params["engineer"]["name"],
      email: params["engineer"]["email"],
      phone: params["engineer"]["phone"]
    }

    TryPhoenix.Repo.insert!(engineer)
    redirect conn, to: "/engineers"
  end

  def show(conn, %{ "id" => id }) do
    engineer = TryPhoenix.Engineer |> TryPhoenix.Repo.get(id)

    render conn, "show.html", engineer: engineer
  end

  def edit(conn, %{ "id" => id }) do
    engineer = TryPhoenix.Engineer |> TryPhoenix.Repo.get(id)

    render conn, "edit.html", engineer: engineer
  end

  def update(conn, %{ "id" => id, "engineer" => %{ "name" => name, "email" => email, "phone" => phone } }) do
    engineer = TryPhoenix.Engineer |> TryPhoenix.Repo.get(id)

    Ecto.Changeset.change(engineer, name: name, email: email, phone: phone)
    |> TryPhoenix.Repo.update!

    conn |> redirect(to: engineer_path(conn, :show, engineer))
  end
end
