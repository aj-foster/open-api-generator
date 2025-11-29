defmodule ProjectApiKey do
  @moduledoc """
  Provides struct and type for a ProjectApiKey
  """

  @type t :: %__MODULE__{
          created_at: integer,
          id: String.t(),
          name: String.t(),
          object: String.t(),
          owner: ProjectApiKeyOwner.t(),
          redacted_value: String.t()
        }

  defstruct [:created_at, :id, :name, :object, :owner, :redacted_value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      id: {:string, :generic},
      name: {:string, :generic},
      object: {:const, "organization.project.api_key"},
      owner: {ProjectApiKeyOwner, :t},
      redacted_value: {:string, :generic}
    ]
  end
end
