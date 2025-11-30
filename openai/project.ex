defmodule OpenAI.Project do
  @moduledoc """
  Provides struct and type for a Project
  """

  @type t :: %__MODULE__{
          archived_at: integer | nil,
          created_at: integer,
          id: String.t(),
          name: String.t(),
          object: String.t(),
          status: String.t()
        }

  defstruct [:archived_at, :created_at, :id, :name, :object, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archived_at: :integer,
      created_at: :integer,
      id: :string,
      name: :string,
      object: {:const, "organization.project"},
      status: {:enum, ["active", "archived"]}
    ]
  end
end
