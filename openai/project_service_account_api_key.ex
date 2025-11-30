defmodule OpenAI.ProjectServiceAccountApiKey do
  @moduledoc """
  Provides struct and type for a ProjectServiceAccountApiKey
  """

  @type t :: %__MODULE__{
          created_at: integer,
          id: String.t(),
          name: String.t(),
          object: String.t(),
          value: String.t()
        }

  defstruct [:created_at, :id, :name, :object, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      id: :string,
      name: :string,
      object: {:const, "organization.project.service_account.api_key"},
      value: :string
    ]
  end
end
