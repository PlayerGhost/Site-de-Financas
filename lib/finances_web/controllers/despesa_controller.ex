defmodule FinancesWeb.DespesaController do
  use FinancesWeb, :controller

  alias Finances.Financas
  alias Finances.Financas.Despesa

  def index(conn, _params) do
    despesas = Financas.list_despesas()
    render(conn, "index.html", despesas: despesas)
  end

  def new(conn, _params) do
    changeset = Financas.change_despesa(%Despesa{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"despesa" => despesa_params}) do
    case Financas.create_despesa(despesa_params) do
      {:ok, despesa} ->
        conn
        |> put_flash(:info, "Despesa created successfully.")
        |> redirect(to: Routes.despesa_path(conn, :show, despesa))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    despesa = Financas.get_despesa!(id)
    render(conn, "show.html", despesa: despesa)
  end

  def edit(conn, %{"id" => id}) do
    despesa = Financas.get_despesa!(id)
    changeset = Financas.change_despesa(despesa)
    render(conn, "edit.html", despesa: despesa, changeset: changeset)
  end

  def update(conn, %{"id" => id, "despesa" => despesa_params}) do
    despesa = Financas.get_despesa!(id)

    case Financas.update_despesa(despesa, despesa_params) do
      {:ok, despesa} ->
        conn
        |> put_flash(:info, "Despesa updated successfully.")
        |> redirect(to: Routes.despesa_path(conn, :show, despesa))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", despesa: despesa, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    despesa = Financas.get_despesa!(id)
    {:ok, _despesa} = Financas.delete_despesa(despesa)

    conn
    |> put_flash(:info, "Despesa deleted successfully.")
    |> redirect(to: Routes.despesa_path(conn, :index))
  end
end
