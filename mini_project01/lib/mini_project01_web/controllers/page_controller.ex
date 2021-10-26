defmodule MiniProject01Web.PageController do
  use MiniProject01Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
