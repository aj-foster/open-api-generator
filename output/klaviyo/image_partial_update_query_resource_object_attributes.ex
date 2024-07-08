defmodule ImagePartialUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a ImagePartialUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{hidden: boolean | nil, name: String.t() | nil}

  defstruct [:hidden, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [hidden: :boolean, name: {:string, :generic}]
  end
end
