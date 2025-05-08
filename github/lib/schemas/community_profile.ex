defmodule GitHub.CommunityProfile do
  @moduledoc """
  Provides struct and type for a CommunityProfile
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          content_reports_enabled: boolean | nil,
          description: String.t() | nil,
          documentation: String.t() | nil,
          files: GitHub.CommunityProfileFiles.t(),
          health_percentage: integer,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :content_reports_enabled,
    :description,
    :documentation,
    :files,
    :health_percentage,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content_reports_enabled: :boolean,
      description: {:union, [{:string, :generic}, :null]},
      documentation: {:union, [{:string, :generic}, :null]},
      files: {GitHub.CommunityProfileFiles, :t},
      health_percentage: :integer,
      updated_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
