defmodule ExceptionDataValues do
  @moduledoc """
  Provides struct and type for a ExceptionDataValues
  """

  @type t :: %__MODULE__{
          mechanism: ExceptionDataValuesMechanism.t() | nil,
          module: String.t() | nil,
          rawStacktrace: map | nil,
          stacktrace: ExceptionDataValuesStacktrace.t() | nil,
          threadId: String.t() | nil,
          type: String.t(),
          value: String.t()
        }

  defstruct [:mechanism, :module, :rawStacktrace, :stacktrace, :threadId, :type, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      mechanism: {ExceptionDataValuesMechanism, :t},
      module: {:string, :generic},
      rawStacktrace: :map,
      stacktrace: {ExceptionDataValuesStacktrace, :t},
      threadId: {:string, :generic},
      type: {:string, :generic},
      value: {:string, :generic}
    ]
  end
end
