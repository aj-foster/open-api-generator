defmodule ApiKey do
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
      actions: [string: :generic],
      collections: [string: :generic],
      description: {:string, :generic},
      expires_at: :integer,
      id: :integer,
      value: {:string, :generic},
      value_prefix: {:string, :generic}
    ]
  end
end
