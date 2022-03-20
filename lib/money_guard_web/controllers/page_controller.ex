defmodule MoneyGuardWeb.PageController do
  use MoneyGuardWeb, :controller

  alias MoneyGuard.Financas
  alias MoneyGuard.Financas.Receita
  alias MoneyGuard.Financas.Despesa

  def index(conn, _params) do
    receitas = Financas.list_receitas()
    despesas = Financas.list_despesas()
    changesetReceita = Financas.change_receita(%Receita{})
    changesetDespesa = Financas.change_despesa(%Despesa{})
    render(conn, "index.html", receitas: receitas, despesas: despesas, MoneyGuardWeb: MoneyGuardWeb, changesetReceita: changesetReceita, changesetDespesa: changesetDespesa)
  end
end
