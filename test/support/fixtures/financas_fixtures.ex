defmodule Finances.FinancasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Finances.Financas` context.
  """

  @doc """
  Generate a receita.
  """
  def receita_fixture(attrs \\ %{}) do
    {:ok, receita} =
      attrs
      |> Enum.into(%{
        nome: "some nome",
        valor: 42
      })
      |> Finances.Financas.create_receita()

    receita
  end

  @doc """
  Generate a despesa.
  """
  def despesa_fixture(attrs \\ %{}) do
    {:ok, despesa} =
      attrs
      |> Enum.into(%{
        nome: "some nome",
        valor: 42
      })
      |> Finances.Financas.create_despesa()

    despesa
  end
end
