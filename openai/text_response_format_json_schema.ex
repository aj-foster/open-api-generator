defmodule OpenAI.TextResponseFormatJsonSchema do
  @moduledoc """
  Provides struct and type for a TextResponseFormatJsonSchema
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t() | nil,
          schema: map,
          strict: boolean | nil,
          type: String.t()
        }

  defstruct [:description, :name, :schema, :strict, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      name: :string,
      schema: :map,
      strict: :boolean,
      type: {:const, "json_schema"}
    ]
  end
end
