defmodule Sentry.ExceptionDataValuesStacktraceFrames do
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
      absPath: :string,
      colNo: :integer,
      context: [[union: [:integer, :string]]],
      errors: :string,
      filename: :string,
      function: :string,
      inApp: :boolean,
      instructionAddr: :string,
      lineNo: :integer,
      module: :string,
      package: :string,
      platform: :string,
      symbol: :string,
      symbolAddr: :string,
      trust: :string,
      vars: :map
    ]
  end
end
