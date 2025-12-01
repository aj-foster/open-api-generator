defmodule OpenAI.ProjectServiceAccountCreateResponse do
  @moduledoc """
  Provides struct and type for a ProjectServiceAccountCreateResponse
  """

  @type t :: %__MODULE__{
          api_key: OpenAI.ProjectServiceAccountApiKey.t(),
          created_at: integer,
          id: String.t(),
          name: String.t(),
          object: String.t(),
          role: String.t()
        }

  defstruct [:api_key, :created_at, :id, :name, :object, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_key: {OpenAI.ProjectServiceAccountApiKey, :t},
      created_at: :integer,
      id: :string,
      name: :string,
      object: {:const, "organization.project.service_account"},
      role: {:const, "member"}
    ]
  end
end
