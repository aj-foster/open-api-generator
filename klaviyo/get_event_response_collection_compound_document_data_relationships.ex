defmodule GetEventResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetEventResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          attributions:
            GetEventResponseCollectionCompoundDocumentDataRelationshipsAttributions.t() | nil,
          metric: GetEventResponseCollectionCompoundDocumentDataRelationshipsMetric.t() | nil,
          profile: GetEventResponseCollectionCompoundDocumentDataRelationshipsProfile.t() | nil
        }

  defstruct [:attributions, :metric, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributions: {GetEventResponseCollectionCompoundDocumentDataRelationshipsAttributions, :t},
      metric: {GetEventResponseCollectionCompoundDocumentDataRelationshipsMetric, :t},
      profile: {GetEventResponseCollectionCompoundDocumentDataRelationshipsProfile, :t}
    ]
  end
end
