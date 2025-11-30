defmodule Klaviyo.PostProfileImportJobResponseData do
  @moduledoc """
  Provides struct and type for a PostProfileImportJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostProfileImportJobResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostProfileImportJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostProfileImportJobResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostProfileImportJobResponseDataRelationships, :t},
      type: {:const, "profile-bulk-import-job"}
    ]
  end
end
