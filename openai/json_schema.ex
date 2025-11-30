defmodule OpenAI.JSONSchema do
  @moduledoc """
  Provides struct and type for a JSONSchema
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t(),
          schema: map | nil,
          strict: boolean | nil
        }

  defstruct [:description, :name, :schema, :strict]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: :string, name: :string, schema: :map, strict: :boolean]
  end
end
