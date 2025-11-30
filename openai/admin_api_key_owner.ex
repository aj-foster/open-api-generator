defmodule OpenAI.AdminApiKeyOwner do
  @moduledoc """
  Provides struct and type for a AdminApiKeyOwner
  """

  @type t :: %__MODULE__{
          created_at: integer | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          role: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:created_at, :id, :name, :role, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created_at: {:integer, "int64"}, id: :string, name: :string, role: :string, type: :string]
  end
end
