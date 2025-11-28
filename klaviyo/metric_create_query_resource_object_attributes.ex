defmodule MetricCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a MetricCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{name: String.t(), service: String.t() | nil}

  defstruct [:name, :service]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, service: {:string, :generic}]
  end
end
