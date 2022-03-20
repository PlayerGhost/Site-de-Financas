defmodule MoneyGuard.Financas.Despesa do
  use Ecto.Schema
  import Ecto.Changeset

  schema "despesas" do
    field :nome, :string
    field :valor, :integer

    timestamps()
  end

  @doc false
  def changeset(despesa, attrs) do
    despesa
    |> cast(attrs, [:nome, :valor])
    |> validate_required([:nome, :valor])
  end
end
