defmodule ExceptionData do
  @moduledoc """
  Provides struct and type for a ExceptionData
  """

  @type t :: %__MODULE__{
          excOmitted: [integer] | nil,
          hasSystemFrames: boolean,
          values: [ExceptionDataValues.t()]
        }

  defstruct [:excOmitted, :hasSystemFrames, :values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [excOmitted: [:integer], hasSystemFrames: :boolean, values: [{ExceptionDataValues, :t}]]
  end
end
