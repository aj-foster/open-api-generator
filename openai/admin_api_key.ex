defmodule OpenAI.AdminApiKey do
  @moduledoc """
  Provides struct and type for a AdminApiKey
  """

  @type t :: %__MODULE__{
          created_at: integer | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          object: String.t() | nil,
          owner: OpenAI.AdminApiKeyOwner.t() | nil,
          redacted_value: String.t() | nil,
          value: String.t() | nil
        }

  defstruct [:created_at, :id, :name, :object, :owner, :redacted_value, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:integer, "int64"},
      id: :string,
      name: :string,
      object: :string,
      owner: {OpenAI.AdminApiKeyOwner, :t},
      redacted_value: :string,
      value: :string
    ]
  end
end
