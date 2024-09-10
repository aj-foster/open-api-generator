defmodule PublicGdprDeleteInput do
  @moduledoc """
  Provides struct and type for a PublicGdprDeleteInput
  """

  @type t :: %__MODULE__{idProperty: String.t() | nil, objectId: String.t()}

  defstruct [:idProperty, :objectId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [idProperty: {:string, :generic}, objectId: {:string, :generic}]
  end
end
