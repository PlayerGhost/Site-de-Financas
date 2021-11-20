defmodule Finances.FinancasTest do
  use Finances.DataCase

  alias Finances.Financas

  describe "receitas" do
    alias Finances.Financas.Receita

    import Finances.FinancasFixtures

    @invalid_attrs %{nome: nil, valor: nil}

    test "list_receitas/0 returns all receitas" do
      receita = receita_fixture()
      assert Financas.list_receitas() == [receita]
    end

    test "get_receita!/1 returns the receita with given id" do
      receita = receita_fixture()
      assert Financas.get_receita!(receita.id) == receita
    end

    test "create_receita/1 with valid data creates a receita" do
      valid_attrs = %{nome: "some nome", valor: 42}

      assert {:ok, %Receita{} = receita} = Financas.create_receita(valid_attrs)
      assert receita.nome == "some nome"
      assert receita.valor == 42
    end

    test "create_receita/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financas.create_receita(@invalid_attrs)
    end

    test "update_receita/2 with valid data updates the receita" do
      receita = receita_fixture()
      update_attrs = %{nome: "some updated nome", valor: 43}

      assert {:ok, %Receita{} = receita} = Financas.update_receita(receita, update_attrs)
      assert receita.nome == "some updated nome"
      assert receita.valor == 43
    end

    test "update_receita/2 with invalid data returns error changeset" do
      receita = receita_fixture()
      assert {:error, %Ecto.Changeset{}} = Financas.update_receita(receita, @invalid_attrs)
      assert receita == Financas.get_receita!(receita.id)
    end

    test "delete_receita/1 deletes the receita" do
      receita = receita_fixture()
      assert {:ok, %Receita{}} = Financas.delete_receita(receita)
      assert_raise Ecto.NoResultsError, fn -> Financas.get_receita!(receita.id) end
    end

    test "change_receita/1 returns a receita changeset" do
      receita = receita_fixture()
      assert %Ecto.Changeset{} = Financas.change_receita(receita)
    end
  end

  describe "despesas" do
    alias Finances.Financas.Despesa

    import Finances.FinancasFixtures

    @invalid_attrs %{nome: nil, valor: nil}

    test "list_despesas/0 returns all despesas" do
      despesa = despesa_fixture()
      assert Financas.list_despesas() == [despesa]
    end

    test "get_despesa!/1 returns the despesa with given id" do
      despesa = despesa_fixture()
      assert Financas.get_despesa!(despesa.id) == despesa
    end

    test "create_despesa/1 with valid data creates a despesa" do
      valid_attrs = %{nome: "some nome", valor: 42}

      assert {:ok, %Despesa{} = despesa} = Financas.create_despesa(valid_attrs)
      assert despesa.nome == "some nome"
      assert despesa.valor == 42
    end

    test "create_despesa/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financas.create_despesa(@invalid_attrs)
    end

    test "update_despesa/2 with valid data updates the despesa" do
      despesa = despesa_fixture()
      update_attrs = %{nome: "some updated nome", valor: 43}

      assert {:ok, %Despesa{} = despesa} = Financas.update_despesa(despesa, update_attrs)
      assert despesa.nome == "some updated nome"
      assert despesa.valor == 43
    end

    test "update_despesa/2 with invalid data returns error changeset" do
      despesa = despesa_fixture()
      assert {:error, %Ecto.Changeset{}} = Financas.update_despesa(despesa, @invalid_attrs)
      assert despesa == Financas.get_despesa!(despesa.id)
    end

    test "delete_despesa/1 deletes the despesa" do
      despesa = despesa_fixture()
      assert {:ok, %Despesa{}} = Financas.delete_despesa(despesa)
      assert_raise Ecto.NoResultsError, fn -> Financas.get_despesa!(despesa.id) end
    end

    test "change_despesa/1 returns a despesa changeset" do
      despesa = despesa_fixture()
      assert %Ecto.Changeset{} = Financas.change_despesa(despesa)
    end
  end
end
