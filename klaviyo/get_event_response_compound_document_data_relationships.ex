defmodule GetEventResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetEventResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          attributions: GetEventResponseCompoundDocumentDataRelationshipsAttributions.t() | nil,
          metric: GetEventResponseCompoundDocumentDataRelationshipsMetric.t() | nil,
          profile: GetEventResponseCompoundDocumentDataRelationshipsProfile.t() | nil
        }

  defstruct [:attributions, :metric, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributions: {GetEventResponseCompoundDocumentDataRelationshipsAttributions, :t},
      metric: {GetEventResponseCompoundDocumentDataRelationshipsMetric, :t},
      profile: {GetEventResponseCompoundDocumentDataRelationshipsProfile, :t}
    ]
  end
end
