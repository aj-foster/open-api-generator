defmodule Typesense.ApiKeySchema do
  @moduledoc """
  Provides struct and type for a ApiKeySchema
  """

  @type t :: %__MODULE__{
          actions: [String.t()],
          collections: [String.t()],
          description: String.t(),
          expires_at: integer | nil,
          value: String.t() | nil
        }

  defstruct [:actions, :collections, :description, :expires_at, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions: [:string],
      collections: [:string],
      description: :string,
      expires_at: {:integer, "int64"},
      value: :string
    ]
  end
end
