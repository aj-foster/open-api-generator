defmodule Klaviyo.SendStrategySubObject do
  @moduledoc """
  Provides struct and type for a SendStrategySubObject
  """

  @type t :: %__MODULE__{
          method: String.t(),
          options_static: Klaviyo.StaticScheduleOptions.t() | nil,
          options_sto: Klaviyo.STOScheduleOptions.t() | nil,
          options_throttled: Klaviyo.ThrottledScheduleOptions.t() | nil
        }

  defstruct [:method, :options_static, :options_sto, :options_throttled]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      method: :string,
      options_static: {Klaviyo.StaticScheduleOptions, :t},
      options_sto: {Klaviyo.STOScheduleOptions, :t},
      options_throttled: {Klaviyo.ThrottledScheduleOptions, :t}
    ]
  end
end
