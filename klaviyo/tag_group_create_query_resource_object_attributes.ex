defmodule TagGroupCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a TagGroupCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{exclusive: boolean | nil, name: String.t()}

  defstruct [:exclusive, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [exclusive: :boolean, name: {:string, :generic}]
  end
end
