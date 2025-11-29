defmodule ProfileIdentifierDTOResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a ProfileIdentifierDTOResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          anonymous_id: String.t() | nil,
          email: String.t() | nil,
          external_id: String.t() | nil,
          phone_number: String.t() | nil
        }

  defstruct [:anonymous_id, :email, :external_id, :phone_number]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      anonymous_id: {:string, :generic},
      email: {:string, :generic},
      external_id: {:string, :generic},
      phone_number: {:string, :generic}
    ]
  end
end
