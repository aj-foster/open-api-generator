defmodule ExceptionDataValuesStacktraceFrames do
  @moduledoc """
  Provides struct and type for a ExceptionDataValuesStacktraceFrames
  """

  @type t :: %__MODULE__{
          absPath: String.t() | nil,
          colNo: integer | nil,
          context: [[integer | String.t()]],
          errors: String.t() | nil,
          filename: String.t(),
          function: String.t(),
          inApp: boolean,
          instructionAddr: String.t() | nil,
          lineNo: integer,
          module: String.t(),
          package: String.t() | nil,
          platform: String.t() | nil,
          symbol: String.t() | nil,
          symbolAddr: String.t() | nil,
          trust: String.t() | nil,
          vars: map | nil
        }

  defstruct [
    :absPath,
    :colNo,
    :context,
    :errors,
    :filename,
    :function,
    :inApp,
    :instructionAddr,
    :lineNo,
    :module,
    :package,
    :platform,
    :symbol,
    :symbolAddr,
    :trust,
    :vars
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      absPath: {:string, :generic},
      colNo: :integer,
      context: [[union: [:integer, string: :generic]]],
      errors: {:string, :generic},
      filename: {:string, :generic},
      function: {:string, :generic},
      inApp: :boolean,
      instructionAddr: {:string, :generic},
      lineNo: :integer,
      module: {:string, :generic},
      package: {:string, :generic},
      platform: {:string, :generic},
      symbol: {:string, :generic},
      symbolAddr: {:string, :generic},
      trust: {:string, :generic},
      vars: :map
    ]
  end
end
