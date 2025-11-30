defmodule HubSpot.Companies.CollectionResponseSimplePublicObjectWithAssociationsForwardPaging do
  @moduledoc """
  Provides struct and type for a CollectionResponseSimplePublicObjectWithAssociationsForwardPaging
  """

  @type t :: %__MODULE__{
          paging: HubSpot.Companies.ForwardPaging.t() | nil,
          results: [HubSpot.Companies.SimplePublicObjectWithAssociations.t()]
        }

  defstruct [:paging, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      paging: {HubSpot.Companies.ForwardPaging, :t},
      results: [{HubSpot.Companies.SimplePublicObjectWithAssociations, :t}]
    ]
  end
end
