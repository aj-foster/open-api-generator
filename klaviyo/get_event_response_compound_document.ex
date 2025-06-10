defmodule GetEventResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetEventResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetEventResponseCompoundDocumentData.t(),
          included:
            [
              AttributionResponseObjectResource.t()
              | MetricResponseObjectResource.t()
              | ProfileResponseObjectResource.t()
            ]
            | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetEventResponseCompoundDocumentData, :t},
      included: [
        union: [
          {AttributionResponseObjectResource, :t},
          {MetricResponseObjectResource, :t},
          {ProfileResponseObjectResource, :t}
        ]
      ]
    ]
  end
end
