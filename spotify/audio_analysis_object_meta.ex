defmodule Spotify.AudioAnalysisObjectMeta do
  @moduledoc """
  Provides struct and type for a AudioAnalysisObjectMeta
  """

  @type t :: %__MODULE__{
          analysis_time: number | nil,
          analyzer_version: String.t() | nil,
          detailed_status: String.t() | nil,
          input_process: String.t() | nil,
          platform: String.t() | nil,
          status_code: integer | nil,
          timestamp: integer | nil
        }

  defstruct [
    :analysis_time,
    :analyzer_version,
    :detailed_status,
    :input_process,
    :platform,
    :status_code,
    :timestamp
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      analysis_time: :number,
      analyzer_version: :string,
      detailed_status: :string,
      input_process: :string,
      platform: :string,
      status_code: :integer,
      timestamp: :integer
    ]
  end
end
