defmodule PostProfileImportJobResponseData do
  @moduledoc """
  Provides struct and type for a PostProfileImportJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostProfileImportJobResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostProfileImportJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostProfileImportJobResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostProfileImportJobResponseDataRelationships, :t},
      type: {:const, "profile-bulk-import-job"}
    ]
  end
end
