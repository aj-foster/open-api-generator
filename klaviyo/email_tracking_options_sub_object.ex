defmodule EmailTrackingOptionsSubObject do
  @moduledoc """
  Provides struct and type for a EmailTrackingOptionsSubObject
  """

  @type t :: %__MODULE__{
          is_add_utm: boolean | nil,
          is_tracking_clicks: boolean | nil,
          is_tracking_opens: boolean | nil,
          utm_params: [UTMParamsSubObject.t()] | nil
        }

  defstruct [:is_add_utm, :is_tracking_clicks, :is_tracking_opens, :utm_params]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      is_add_utm: :boolean,
      is_tracking_clicks: :boolean,
      is_tracking_opens: :boolean,
      utm_params: [{UTMParamsSubObject, :t}]
    ]
  end
end
