defmodule PublicAssociationsForObject do
  @moduledoc """
  Provides struct and type for a PublicAssociationsForObject
  """

  @type t :: %__MODULE__{to: PublicObjectId.t(), types: [AssociationSpec.t()]}

  defstruct [:to, :types]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [to: {PublicObjectId, :t}, types: [{AssociationSpec, :t}]]
  end
end
