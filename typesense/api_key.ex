defmodule Typesense.ApiKey do
  @moduledoc """
  Provides struct and type for a ApiKey
  """

  @type t :: %__MODULE__{
          actions: [String.t()] | nil,
          collections: [String.t()] | nil,
          description: String.t() | nil,
          expires_at: integer | nil,
          id: integer | nil,
          value: String.t() | nil,
          value_prefix: String.t() | nil
        }

  defstruct [:actions, :collections, :description, :expires_at, :id, :value, :value_prefix]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions: [:string],
      collections: [:string],
      description: :string,
      expires_at: {:integer, "int64"},
      id: {:integer, "int64"},
      value: :string,
      value_prefix: :string
    ]
  end
end
