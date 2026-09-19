defmodule Sentry.ExceptionData do
  @moduledoc """
  Provides struct and type for a ExceptionData
  """

  @type t :: %__MODULE__{
          excOmitted: [integer] | nil,
          hasSystemFrames: boolean,
          values: [Sentry.ExceptionDataValues.t()]
        }

  defstruct [:excOmitted, :hasSystemFrames, :values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      excOmitted: [:integer],
      hasSystemFrames: :boolean,
      values: [{Sentry.ExceptionDataValues, :t}]
    ]
  end
end
