defmodule MoneyGuardWeb.ReceitaController do
  use MoneyGuardWeb, :controller

  alias MoneyGuard.Financas
  alias MoneyGuard.Financas.Receita

  def index(conn, _params) do
    receitas = Financas.list_receitas()
    render(conn, "index.html", receitas: receitas)
  end

  def new(conn, _params) do
    changesetReceita = Financas.change_receita(%Receita{})
    render(conn, "new.html", changesetReceita: changesetReceita)
  end

  def create(conn, %{"receita" => receita_params}) do
    case Financas.create_receita(receita_params) do
      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita created successfully.")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    receita = Financas.get_receita!(id)
    changesetReceita = Financas.change_receita(receita)
    render(conn, "edit.html", receita: receita, changesetReceita: changesetReceita)
  end

  def update(conn, %{"id" => id, "receita" => receita_params}) do
    receita = Financas.get_receita!(id)

    case Financas.update_receita(receita, receita_params) do
      {:ok, receita} ->
        conn
        |> put_flash(:info, "Receita updated successfully.")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", receita: receita, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    receita = Financas.get_receita!(id)
    {:ok, _receita} = Financas.delete_receita(receita)

    conn
    |> put_flash(:info, "Receita deleted successfully.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
