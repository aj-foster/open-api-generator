defmodule SendStrategySubObject do
  @moduledoc """
  Provides struct and type for a SendStrategySubObject
  """

  @type t :: %__MODULE__{
          method: String.t(),
          options_static: StaticScheduleOptions.t() | nil,
          options_sto: STOScheduleOptions.t() | nil,
          options_throttled: ThrottledScheduleOptions.t() | nil
        }

  defstruct [:method, :options_static, :options_sto, :options_throttled]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      method: {:string, :generic},
      options_static: {StaticScheduleOptions, :t},
      options_sto: {STOScheduleOptions, :t},
      options_throttled: {ThrottledScheduleOptions, :t}
    ]
  end
end
