defmodule Klaviyo.GetFlowResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetFlowResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetFlowResponseCompoundDocumentData.t(),
          included:
            [Klaviyo.FlowActionResponseObjectResource.t() | Klaviyo.TagResponseObjectResource.t()]
            | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetFlowResponseCompoundDocumentData, :t},
      included: [
        union: [
          {Klaviyo.FlowActionResponseObjectResource, :t},
          {Klaviyo.TagResponseObjectResource, :t}
        ]
      ]
    ]
  end
end
