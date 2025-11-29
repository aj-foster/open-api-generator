defmodule AudioAnalysisObject do
  @moduledoc """
  Provides struct and type for a AudioAnalysisObject
  """

  @type t :: %__MODULE__{
          bars: [TimeIntervalObject.t()] | nil,
          beats: [TimeIntervalObject.t()] | nil,
          meta: AudioAnalysisObjectMeta.t() | nil,
          sections: [SectionObject.t()] | nil,
          segments: [SegmentObject.t()] | nil,
          tatums: [TimeIntervalObject.t()] | nil,
          track: AudioAnalysisObjectTrack.t() | nil
        }

  defstruct [:bars, :beats, :meta, :sections, :segments, :tatums, :track]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bars: [{TimeIntervalObject, :t}],
      beats: [{TimeIntervalObject, :t}],
      meta: {AudioAnalysisObjectMeta, :t},
      sections: [{SectionObject, :t}],
      segments: [{SegmentObject, :t}],
      tatums: [{TimeIntervalObject, :t}],
      track: {AudioAnalysisObjectTrack, :t}
    ]
  end
end
