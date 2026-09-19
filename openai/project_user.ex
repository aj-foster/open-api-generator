defmodule OpenAI.ProjectUser do
  @moduledoc """
  Provides struct and type for a ProjectUser
  """

  @type t :: %__MODULE__{
          added_at: integer,
          email: String.t(),
          id: String.t(),
          name: String.t(),
          object: String.t(),
          role: String.t()
        }

  defstruct [:added_at, :email, :id, :name, :object, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      added_at: :integer,
      email: :string,
      id: :string,
      name: :string,
      object: {:const, "organization.project.user"},
      role: {:enum, ["owner", "member"]}
    ]
  end
end
