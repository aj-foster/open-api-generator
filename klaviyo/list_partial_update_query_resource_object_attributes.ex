defmodule ListPartialUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a ListPartialUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{name: String.t()}

  defstruct [:name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}]
  end
end
