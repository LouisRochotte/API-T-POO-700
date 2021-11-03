defmodule TimemanagerWeb.WorkingtimeController do
  use TimemanagerWeb, :controller

  alias Timemanager.Data
  alias Timemanager.Data.Workingtime

  action_fallback TimemanagerWeb.FallbackController

  def index(conn, _params) do
    workingtimes = Data.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, _params) do
    with {:ok, %Workingtime{} = _params} <-
           Data.create_workingtime(%{
             start: _params["workingtimes"]["start"],
             end: _params["workingtimes"]["end"],
             user: _params["userID"]
           }) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtime_path(conn, :show, _params))
      |> render("show.json", workingtime: _params)
    end
  end

  def show(conn, %{"id" => id}) do
    workingtime = Data.get_workingtime!(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Data.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <-
           Data.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = Data.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- Data.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end