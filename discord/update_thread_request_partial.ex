defmodule UpdateThreadRequestPartial do
  @moduledoc """
  Provides struct and type for a UpdateThreadRequestPartial
  """

  @type t :: %__MODULE__{
          applied_tags: [String.t()] | nil,
          archived: boolean | nil,
          auto_archive_duration: integer | nil,
          bitrate: integer | nil,
          flags: integer | nil,
          invitable: boolean | nil,
          locked: boolean | nil,
          name: String.t() | nil,
          rate_limit_per_user: integer | nil,
          rtc_region: String.t() | nil,
          user_limit: integer | nil,
          video_quality_mode: integer | nil
        }

  defstruct [
    :applied_tags,
    :archived,
    :auto_archive_duration,
    :bitrate,
    :flags,
    :invitable,
    :locked,
    :name,
    :rate_limit_per_user,
    :rtc_region,
    :user_limit,
    :video_quality_mode
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_tags: {:union, [[string: :generic], :null]},
      archived: {:union, [:boolean, :null]},
      auto_archive_duration: {:union, [:integer, :null]},
      bitrate: {:union, [:integer, :null]},
      flags: {:union, [:integer, :null]},
      invitable: {:union, [:boolean, :null]},
      locked: {:union, [:boolean, :null]},
      name: {:union, [{:string, :generic}, :null]},
      rate_limit_per_user: {:union, [:integer, :null]},
      rtc_region: {:union, [{:string, :generic}, :null]},
      user_limit: {:union, [:integer, :null]},
      video_quality_mode: {:union, [:integer, :null]}
    ]
  end
end
