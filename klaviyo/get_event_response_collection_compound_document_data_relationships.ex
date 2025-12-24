defmodule Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetEventResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          attributions:
            Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationshipsAttributions.t()
            | nil,
          metric:
            Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationshipsMetric.t() | nil,
          profile:
            Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationshipsProfile.t() | nil
        }

  defstruct [:attributions, :metric, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributions:
        {Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationshipsAttributions, :t},
      metric: {Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationshipsMetric, :t},
      profile: {Klaviyo.GetEventResponseCollectionCompoundDocumentDataRelationshipsProfile, :t}
    ]
  end
end
