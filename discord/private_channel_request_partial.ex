defmodule PrivateChannelRequestPartial do
  @moduledoc """
  Provides struct and type for a PrivateChannelRequestPartial
  """

  @type t :: %__MODULE__{icon: String.t() | nil, name: String.t() | nil}

  defstruct [:icon, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [icon: {:union, [{:string, :generic}, :null]}, name: {:union, [{:string, :generic}, :null]}]
  end
end
