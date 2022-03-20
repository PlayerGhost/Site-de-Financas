defmodule MoneyGuard.Repo.Migrations.CreateReceitas do
  use Ecto.Migration

  def change do
    create table(:receitas) do
      add :nome, :string
      add :valor, :integer

      timestamps()
    end
  end
end
