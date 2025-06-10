defmodule UTMParamsSubObject do
  @moduledoc """
  Provides struct and type for a UTMParamsSubObject
  """

  @type t :: %__MODULE__{name: String.t(), value: String.t()}

  defstruct [:name, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, value: {:string, :generic}]
  end
end
