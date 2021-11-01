defmodule TimemanagerWeb.UserView do
  use TimemanagerWeb, :view
  alias TimemanagerWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      firstname: user.firstname,
      lastname: user.lastname,
      email: user.email,
      address: user.address,
      zipcode: user.zipcode,
      city: user.city,
      country: user.country,
      role: user.role
    }
  end
end