defmodule OpenAI.ProjectApiKey do
  @moduledoc """
  Provides struct and type for a ProjectApiKey
  """

  @type t :: %__MODULE__{
          created_at: integer,
          id: String.t(),
          name: String.t(),
          object: String.t(),
          owner: OpenAI.ProjectApiKeyOwner.t(),
          redacted_value: String.t()
        }

  defstruct [:created_at, :id, :name, :object, :owner, :redacted_value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      id: :string,
      name: :string,
      object: {:const, "organization.project.api_key"},
      owner: {OpenAI.ProjectApiKeyOwner, :t},
      redacted_value: :string
    ]
  end
end
