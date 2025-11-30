defmodule Sentry.ExceptionDataValues do
  @moduledoc """
  Provides struct and type for a ExceptionDataValues
  """

  @type t :: %__MODULE__{
          mechanism: Sentry.ExceptionDataValuesMechanism.t() | nil,
          module: String.t() | nil,
          rawStacktrace: map | nil,
          stacktrace: Sentry.ExceptionDataValuesStacktrace.t() | nil,
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
      mechanism: {Sentry.ExceptionDataValuesMechanism, :t},
      module: :string,
      rawStacktrace: :map,
      stacktrace: {Sentry.ExceptionDataValuesStacktrace, :t},
      threadId: :string,
      type: :string,
      value: :string
    ]
  end
end
