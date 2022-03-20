defmodule MoneyGuard.Financas.Receita do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receitas" do
    field :nome, :string
    field :valor, :integer

    timestamps()
  end

  @doc false
  def changeset(receita, attrs) do
    receita
    |> cast(attrs, [:nome, :valor])
    |> validate_required([:nome, :valor])
  end
end
