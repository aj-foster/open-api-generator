defmodule Klaviyo.ProfileIdentifierDTOResourceObject do
  @moduledoc """
  Provides struct and type for a ProfileIdentifierDTOResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.ProfileIdentifierDTOResourceObjectAttributes.t(),
          id: String.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.ProfileIdentifierDTOResourceObjectAttributes, :t},
      id: :string,
      type: {:const, "profile"}
    ]
  end
end
