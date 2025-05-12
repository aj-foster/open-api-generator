defmodule MetricCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a MetricCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: MetricCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: {MetricCreateQueryResourceObjectAttributes, :t}, type: {:const, "metric"}]
  end
end
