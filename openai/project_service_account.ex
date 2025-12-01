defmodule OpenAI.ProjectServiceAccount do
  @moduledoc """
  Provides struct and type for a ProjectServiceAccount
  """

  @type t :: %__MODULE__{
          created_at: integer,
          id: String.t(),
          name: String.t(),
          object: String.t(),
          role: String.t()
        }

  defstruct [:created_at, :id, :name, :object, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      id: :string,
      name: :string,
      object: {:const, "organization.project.service_account"},
      role: {:enum, ["owner", "member"]}
    ]
  end
end
