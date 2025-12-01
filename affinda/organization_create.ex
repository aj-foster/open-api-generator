defmodule Affinda.OrganizationCreate do
  @moduledoc """
  Provides struct and type for a OrganizationCreate
  """

  @type t :: %__MODULE__{
          avatar: binary | nil,
          name: String.t(),
          resthookSignatureKey: String.t() | nil
        }

  defstruct [:avatar, :name, :resthookSignatureKey]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [avatar: {:string, "binary"}, name: :string, resthookSignatureKey: :string]
  end
end
