defmodule Klaviyo.GetTagResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetTagResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetTagResponseCompoundDocumentData.t(),
          included: [Klaviyo.TagGroupResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetTagResponseCompoundDocumentData, :t},
      included: [{Klaviyo.TagGroupResponseObjectResource, :t}]
    ]
  end
end
