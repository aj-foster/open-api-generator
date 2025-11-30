defmodule Mollie.EntityCustomer do
  @moduledoc """
  Provides struct and type for a EntityCustomer
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityCustomerLinks.t() | nil,
          createdAt: String.t() | nil,
          email: String.t() | nil,
          id: Mollie.EntityCustomerId.t() | nil,
          locale: String.t() | nil,
          metadata: map | String.t() | [String.t()] | nil,
          mode: String.t() | nil,
          name: String.t() | nil,
          resource: String.t() | nil,
          testmode: boolean | nil
        }

  defstruct [
    :_links,
    :createdAt,
    :email,
    :id,
    :locale,
    :metadata,
    :mode,
    :name,
    :resource,
    :testmode
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntityCustomerLinks, :t},
      createdAt: :string,
      email: {:union, [:string, :null]},
      id: {Mollie.EntityCustomerId, :t},
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
         ]},
      metadata: {:union, [:map, :string, [:string], :null]},
      mode: {:enum, ["live", "test"]},
      name: {:union, [:string, :null]},
      resource: :string,
      testmode: {:union, [:boolean, :null]}
    ]
  end
end
