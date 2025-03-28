defmodule AdminApiKey do
  @moduledoc """
  Provides struct and type for a AdminApiKey
  """

  @type t :: %__MODULE__{
          created_at: integer | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          object: String.t() | nil,
          owner: AdminApiKeyOwner.t() | nil,
          redacted_value: String.t() | nil,
          value: String.t() | nil
        }

  defstruct [:created_at, :id, :name, :object, :owner, :redacted_value, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:integer, :int64},
      id: {:string, :generic},
      name: {:string, :generic},
      object: {:string, :generic},
      owner: {AdminApiKeyOwner, :t},
      redacted_value: {:string, :generic},
      value: {:string, :generic}
    ]
  end
end
