defmodule Klaviyo.GetProfileImportJobResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetProfileImportJobResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetProfileImportJobResponseCollectionCompoundDocumentData.t()],
          links: Klaviyo.CollectionLinks.t()
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.GetProfileImportJobResponseCollectionCompoundDocumentData, :t}],
      links: {Klaviyo.CollectionLinks, :t}
    ]
  end
end
