defmodule ExceptionDataValuesStacktrace do
  @moduledoc """
  Provides struct and type for a ExceptionDataValuesStacktrace
  """

  @type t :: %__MODULE__{
          frames: [ExceptionDataValuesStacktraceFrames.t()],
          framesOmitted: String.t() | nil,
          hasSystemFrames: boolean,
          registers: String.t() | nil
        }

  defstruct [:frames, :framesOmitted, :hasSystemFrames, :registers]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      frames: [{ExceptionDataValuesStacktraceFrames, :t}],
      framesOmitted: {:string, :generic},
      hasSystemFrames: :boolean,
      registers: {:string, :generic}
    ]
  end
end
