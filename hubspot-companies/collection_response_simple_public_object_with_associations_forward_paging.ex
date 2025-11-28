defmodule CollectionResponseSimplePublicObjectWithAssociationsForwardPaging do
  @moduledoc """
  Provides struct and type for a CollectionResponseSimplePublicObjectWithAssociationsForwardPaging
  """

  @type t :: %__MODULE__{
          paging: ForwardPaging.t() | nil,
          results: [SimplePublicObjectWithAssociations.t()]
        }

  defstruct [:paging, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [paging: {ForwardPaging, :t}, results: [{SimplePublicObjectWithAssociations, :t}]]
  end
end
