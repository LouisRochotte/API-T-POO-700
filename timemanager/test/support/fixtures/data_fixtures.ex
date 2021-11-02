defmodule Timemanager.DataFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanager.Data` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        address: "some address",
        city: "some city",
        country: "some country",
        email: "some email",
        firstname: "some firstname",
        lastname: "some lastname",
        role: "some role",
        zipcode: "some zipcode"
      })
      |> Timemanager.Data.create_user()

    user
  end
end
