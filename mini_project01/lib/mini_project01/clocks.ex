defmodule MiniProject01.Clocks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clocks" do
    field :status, :boolean, default: true,  null: false
    field :time, :naive_datetime, null: false
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(clocks, attrs) do
    clocks
    |> cast(attrs, [:time, :status])
    |> validate_required([:time, :status, :user])
  end
end
