defmodule GetListRetrieveResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetListRetrieveResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetListRetrieveResponseCompoundDocumentData.t(),
          included: [TagResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetListRetrieveResponseCompoundDocumentData, :t},
      included: [{TagResponseObjectResource, :t}]
    ]
  end
end
