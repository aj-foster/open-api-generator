defmodule Spotify.AudioAnalysisObject do
  @moduledoc """
  Provides struct and type for a AudioAnalysisObject
  """

  @type t :: %__MODULE__{
          bars: [Spotify.TimeIntervalObject.t()] | nil,
          beats: [Spotify.TimeIntervalObject.t()] | nil,
          meta: Spotify.AudioAnalysisObjectMeta.t() | nil,
          sections: [Spotify.SectionObject.t()] | nil,
          segments: [Spotify.SegmentObject.t()] | nil,
          tatums: [Spotify.TimeIntervalObject.t()] | nil,
          track: Spotify.AudioAnalysisObjectTrack.t() | nil
        }

  defstruct [:bars, :beats, :meta, :sections, :segments, :tatums, :track]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bars: [{Spotify.TimeIntervalObject, :t}],
      beats: [{Spotify.TimeIntervalObject, :t}],
      meta: {Spotify.AudioAnalysisObjectMeta, :t},
      sections: [{Spotify.SectionObject, :t}],
      segments: [{Spotify.SegmentObject, :t}],
      tatums: [{Spotify.TimeIntervalObject, :t}],
      track: {Spotify.AudioAnalysisObjectTrack, :t}
    ]
  end
end
