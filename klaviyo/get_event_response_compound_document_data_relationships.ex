defmodule Klaviyo.GetEventResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetEventResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          attributions:
            Klaviyo.GetEventResponseCompoundDocumentDataRelationshipsAttributions.t() | nil,
          metric: Klaviyo.GetEventResponseCompoundDocumentDataRelationshipsMetric.t() | nil,
          profile: Klaviyo.GetEventResponseCompoundDocumentDataRelationshipsProfile.t() | nil
        }

  defstruct [:attributions, :metric, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributions: {Klaviyo.GetEventResponseCompoundDocumentDataRelationshipsAttributions, :t},
      metric: {Klaviyo.GetEventResponseCompoundDocumentDataRelationshipsMetric, :t},
      profile: {Klaviyo.GetEventResponseCompoundDocumentDataRelationshipsProfile, :t}
    ]
  end
end
