defmodule AssociationSpec do
  @moduledoc """
  Provides struct and type for a AssociationSpec
  """

  @type t :: %__MODULE__{associationCategory: String.t(), associationTypeId: integer}

  defstruct [:associationCategory, :associationTypeId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      associationCategory: {:enum, ["HUBSPOT_DEFINED", "USER_DEFINED", "INTEGRATOR_DEFINED"]},
      associationTypeId: :integer
    ]
  end
end
