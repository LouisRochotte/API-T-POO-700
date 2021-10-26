defmodule MiniProject01.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add :time, :datetime
      add :status, :boolean

      timestamps()
    end

  end
end
