defmodule TryPhoenix.Engineer do

  use TryPhoenix.Web, :model

  schema "engineers" do
    field :name, :string
    field :email, :string
    field :phone, :string

    timestamps()
  end

end
