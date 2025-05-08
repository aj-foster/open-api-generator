defmodule EmailTrackingOptions do
  @moduledoc """
  Provides struct and type for a EmailTrackingOptions
  """

  @type t :: %__MODULE__{
          add_utm: boolean,
          is_tracking_clicks: boolean,
          is_tracking_opens: boolean,
          utm_params: [UtmParamInfo.t()]
        }

  defstruct [:add_utm, :is_tracking_clicks, :is_tracking_opens, :utm_params]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      add_utm: :boolean,
      is_tracking_clicks: :boolean,
      is_tracking_opens: :boolean,
      utm_params: [{UtmParamInfo, :t}]
    ]
  end
end
