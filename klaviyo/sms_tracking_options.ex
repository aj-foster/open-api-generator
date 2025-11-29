defmodule SMSTrackingOptions do
  @moduledoc """
  Provides struct and type for a SMSTrackingOptions
  """

  @type t :: %__MODULE__{add_utm: boolean, utm_params: [UtmParamInfo.t()]}

  defstruct [:add_utm, :utm_params]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [add_utm: :boolean, utm_params: [{UtmParamInfo, :t}]]
  end
end
