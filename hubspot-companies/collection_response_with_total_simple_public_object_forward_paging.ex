defmodule CollectionResponseWithTotalSimplePublicObjectForwardPaging do
  @moduledoc """
  Provides struct and type for a CollectionResponseWithTotalSimplePublicObjectForwardPaging
  """

  @type t :: %__MODULE__{
          paging: ForwardPaging.t() | nil,
          results: [SimplePublicObject.t()],
          total: integer
        }

  defstruct [:paging, :results, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [paging: {ForwardPaging, :t}, results: [{SimplePublicObject, :t}], total: :integer]
  end
end
