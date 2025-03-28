defmodule SMSTrackingOptionsSubObject do
  @moduledoc """
  Provides struct and type for a SMSTrackingOptionsSubObject
  """

  @type t :: %__MODULE__{is_add_utm: boolean | nil, utm_params: [UTMParamsSubObject.t()] | nil}

  defstruct [:is_add_utm, :utm_params]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [is_add_utm: :boolean, utm_params: [{UTMParamsSubObject, :t}]]
  end
end
