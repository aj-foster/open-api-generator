defmodule CustomFieldConfig do
  @moduledoc """
  Provides struct and type for a CustomFieldConfig
  """

  @type t :: %__MODULE__{dataPoint: String.t(), weight: number}

  defstruct [:dataPoint, :weight]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [dataPoint: {:string, :generic}, weight: :number]
  end
end
