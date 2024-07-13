defmodule GitHub.Repository.Rule.ParamsCodeScanningTool do
  @moduledoc """
  Provides struct and type for a Repository.Rule.ParamsCodeScanningTool
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          alerts_threshold: String.t(),
          security_alerts_threshold: String.t(),
          tool: String.t()
        }

  defstruct [:__info__, :alerts_threshold, :security_alerts_threshold, :tool]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      alerts_threshold: {:enum, ["none", "errors", "errors_and_warnings", "all"]},
      security_alerts_threshold:
        {:enum, ["none", "critical", "high_or_higher", "medium_or_higher", "all"]},
      tool: {:string, :generic}
    ]
  end
end
