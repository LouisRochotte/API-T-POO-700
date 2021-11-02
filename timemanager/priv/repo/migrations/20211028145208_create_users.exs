defmodule Timemanager.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstname, :string
      add :lastname, :string
      add :email, :string
      add :address, :string
      add :zipcode, :string
      add :city, :string
      add :country, :string
      add :role, :string

      timestamps()
    end
  end
end
