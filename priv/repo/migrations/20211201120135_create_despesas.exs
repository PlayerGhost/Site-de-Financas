defmodule MoneyGuard.Repo.Migrations.CreateDespesas do
  use Ecto.Migration

  def change do
    create table(:despesas) do
      add :nome, :string
      add :valor, :integer

      timestamps()
    end
  end
end
