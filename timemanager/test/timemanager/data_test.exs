defmodule Timemanager.DataTest do
  use Timemanager.DataCase

  alias Timemanager.Data

  describe "users" do
    alias Timemanager.Data.User

    import Timemanager.DataFixtures

    @invalid_attrs %{address: nil, city: nil, country: nil, email: nil, firstname: nil, lastname: nil, role: nil, zipcode: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Data.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Data.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{address: "some address", city: "some city", country: "some country", email: "some email", firstname: "some firstname", lastname: "some lastname", role: "some role", zipcode: "some zipcode"}

      assert {:ok, %User{} = user} = Data.create_user(valid_attrs)
      assert user.address == "some address"
      assert user.city == "some city"
      assert user.country == "some country"
      assert user.email == "some email"
      assert user.firstname == "some firstname"
      assert user.lastname == "some lastname"
      assert user.role == "some role"
      assert user.zipcode == "some zipcode"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{address: "some updated address", city: "some updated city", country: "some updated country", email: "some updated email", firstname: "some updated firstname", lastname: "some updated lastname", role: "some updated role", zipcode: "some updated zipcode"}

      assert {:ok, %User{} = user} = Data.update_user(user, update_attrs)
      assert user.address == "some updated address"
      assert user.city == "some updated city"
      assert user.country == "some updated country"
      assert user.email == "some updated email"
      assert user.firstname == "some updated firstname"
      assert user.lastname == "some updated lastname"
      assert user.role == "some updated role"
      assert user.zipcode == "some updated zipcode"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_user(user, @invalid_attrs)
      assert user == Data.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Data.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Data.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Data.change_user(user)
    end
  end
end
