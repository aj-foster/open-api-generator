defmodule TagGroupUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a TagGroupUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{name: String.t(), return_fields: [String.t()] | nil}

  defstruct [:name, :return_fields]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, return_fields: [string: :generic]]
  end
end
