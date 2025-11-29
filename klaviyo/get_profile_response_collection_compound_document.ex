defmodule GetProfileResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [GetProfileResponseCollectionCompoundDocumentData.t()],
          links: CollectionLinks.t()
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetProfileResponseCollectionCompoundDocumentData, :t}], links: {CollectionLinks, :t}]
  end
end
