defmodule Avatar do
  @moduledoc """
  Provides struct and type for a Avatar
  """

  @type t :: %__MODULE__{avatarType: String.t() | nil, avatarUuid: String.t() | nil}

  defstruct [:avatarType, :avatarUuid]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [avatarType: {:string, :generic}, avatarUuid: {:string, :generic}]
  end
end
