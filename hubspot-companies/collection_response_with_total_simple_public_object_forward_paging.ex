defmodule HubSpot.Companies.CollectionResponseWithTotalSimplePublicObjectForwardPaging do
  @moduledoc """
  Provides struct and type for a CollectionResponseWithTotalSimplePublicObjectForwardPaging
  """

  @type t :: %__MODULE__{
          paging: HubSpot.Companies.ForwardPaging.t() | nil,
          results: [HubSpot.Companies.SimplePublicObject.t()],
          total: integer
        }

  defstruct [:paging, :results, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      paging: {HubSpot.Companies.ForwardPaging, :t},
      results: [{HubSpot.Companies.SimplePublicObject, :t}],
      total: {:integer, "int32"}
    ]
  end
end
