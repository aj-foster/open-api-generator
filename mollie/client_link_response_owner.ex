defmodule Mollie.ClientLinkResponseOwner do
  @moduledoc """
  Provides struct and type for a ClientLinkResponseOwner
  """

  @type t :: %__MODULE__{
          email: String.t(),
          familyName: String.t(),
          givenName: String.t(),
          locale: String.t() | nil
        }

  defstruct [:email, :familyName, :givenName, :locale]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: :string,
      familyName: :string,
      givenName: :string,
      locale:
        {:enum,
         [
           "en_US",
           "en_GB",
           "nl_NL",
           "nl_BE",
           "de_DE",
           "de_AT",
           "de_CH",
           "fr_FR",
           "fr_BE",
           "es_ES",
           "ca_ES",
           "pt_PT",
           "it_IT",
           "nb_NO",
           "sv_SE",
           "fi_FI",
           "da_DK",
           "is_IS",
           "hu_HU",
           "pl_PL",
           "lv_LV",
           "lt_LT",
           "null"
         ]}
    ]
  end
end
