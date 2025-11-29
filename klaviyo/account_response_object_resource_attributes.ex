defmodule AccountResponseObjectResourceAttributes do
  @moduledoc """
  Provides struct and type for a AccountResponseObjectResourceAttributes
  """

  @type t :: %__MODULE__{
          contact_information: ContactInformation.t(),
          industry: String.t(),
          preferred_currency: String.t(),
          public_api_key: String.t(),
          timezone: String.t()
        }

  defstruct [:contact_information, :industry, :preferred_currency, :public_api_key, :timezone]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      contact_information: {ContactInformation, :t},
      industry: {:string, :generic},
      preferred_currency: {:string, :generic},
      public_api_key: {:string, :generic},
      timezone: {:string, :generic}
    ]
  end
end
