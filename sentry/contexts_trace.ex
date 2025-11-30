defmodule Sentry.ContextsTrace do
  @moduledoc """
  Provides struct and type for a ContextsTrace
  """

  @type t :: %__MODULE__{
          op: String.t() | nil,
          span_id: String.t() | nil,
          trace_id: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:op, :span_id, :trace_id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [op: :string, span_id: :string, trace_id: :string, type: :string]
  end
end
