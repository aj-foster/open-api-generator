defmodule Klaviyo.GetEventResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetEventResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetEventResponseCompoundDocumentData.t(),
          included:
            [
              Klaviyo.AttributionResponseObjectResource.t()
              | Klaviyo.MetricResponseObjectResource.t()
              | Klaviyo.ProfileResponseObjectResource.t()
            ]
            | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetEventResponseCompoundDocumentData, :t},
      included: [
        union: [
          {Klaviyo.AttributionResponseObjectResource, :t},
          {Klaviyo.MetricResponseObjectResource, :t},
          {Klaviyo.ProfileResponseObjectResource, :t}
        ]
      ]
    ]
  end
end
