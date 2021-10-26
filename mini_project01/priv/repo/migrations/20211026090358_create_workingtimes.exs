defmodule MiniProject01.Repo.Migrations.CreateWorkingtimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
      add :start, :datetime, null: false
      add :end, :datetime, null: false

      timestamps()
    end

  end
end
