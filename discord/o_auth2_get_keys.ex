defmodule OAuth2GetKeys do
  @moduledoc """
  Provides struct and type for a OAuth2GetKeys
  """

  @type t :: %__MODULE__{keys: [OAuth2Key.t()]}

  defstruct [:keys]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [keys: [{OAuth2Key, :t}]]
  end
end
