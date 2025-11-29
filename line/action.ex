defmodule Action do
  @moduledoc """
  Provides struct and type for a Action
  """

  @type t :: %__MODULE__{label: String.t() | nil, type: String.t() | nil}

  defstruct [:label, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [label: {:string, :generic}, type: {:string, :generic}]
  end
end
