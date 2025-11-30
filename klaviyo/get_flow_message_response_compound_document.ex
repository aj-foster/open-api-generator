defmodule Klaviyo.GetFlowMessageResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetFlowMessageResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetFlowMessageResponseCompoundDocumentData.t(),
          included:
            [
              Klaviyo.FlowActionResponseObjectResource.t()
              | Klaviyo.TemplateResponseObjectResource.t()
            ]
            | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetFlowMessageResponseCompoundDocumentData, :t},
      included: [
        union: [
          {Klaviyo.FlowActionResponseObjectResource, :t},
          {Klaviyo.TemplateResponseObjectResource, :t}
        ]
      ]
    ]
  end
end
