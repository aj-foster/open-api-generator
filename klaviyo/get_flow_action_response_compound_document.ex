defmodule Klaviyo.GetFlowActionResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetFlowActionResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetFlowActionResponseCompoundDocumentData.t(),
          included:
            [
              Klaviyo.FlowMessageResponseObjectResource.t()
              | Klaviyo.FlowResponseObjectResource.t()
            ]
            | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetFlowActionResponseCompoundDocumentData, :t},
      included: [
        union: [
          {Klaviyo.FlowMessageResponseObjectResource, :t},
          {Klaviyo.FlowResponseObjectResource, :t}
        ]
      ]
    ]
  end
end
