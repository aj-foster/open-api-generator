defmodule GitHub.OrgRepoCustomPropertyValues do
  @moduledoc """
  Provides struct and type for a OrgRepoCustomPropertyValues
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          properties: [GitHub.CustomPropertyValue.t()],
          repository_full_name: String.t(),
          repository_id: integer,
          repository_name: String.t()
        }

  defstruct [:__info__, :properties, :repository_full_name, :repository_id, :repository_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      properties: [{GitHub.CustomPropertyValue, :t}],
      repository_full_name: {:string, :generic},
      repository_id: :integer,
      repository_name: {:string, :generic}
    ]
  end
end
