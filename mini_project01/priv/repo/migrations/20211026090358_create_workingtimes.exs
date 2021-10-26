defmodule MiniProject01.Repo.Migrations.CreateWorkingtimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
      add :start, :datetime
      add :end, :datetime

      timestamps()
    end

  end
end
