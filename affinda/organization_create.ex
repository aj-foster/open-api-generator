defmodule OrganizationCreate do
  @moduledoc """
  Provides struct and type for a OrganizationCreate
  """

  @type t :: %__MODULE__{
          avatar: String.t() | nil,
          name: String.t(),
          resthookSignatureKey: String.t() | nil
        }

  defstruct [:avatar, :name, :resthookSignatureKey]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar: {:string, :generic},
      name: {:string, :generic},
      resthookSignatureKey: {:string, :generic}
    ]
  end
end
