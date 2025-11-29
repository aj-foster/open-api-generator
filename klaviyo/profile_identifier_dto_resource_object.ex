defmodule ProfileIdentifierDTOResourceObject do
  @moduledoc """
  Provides struct and type for a ProfileIdentifierDTOResourceObject
  """

  @type t :: %__MODULE__{
          attributes: ProfileIdentifierDTOResourceObjectAttributes.t(),
          id: String.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {ProfileIdentifierDTOResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "profile"}
    ]
  end
end
