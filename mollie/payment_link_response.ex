defmodule Mollie.PaymentLinkResponse do
  @moduledoc """
  Provides struct and type for a PaymentLinkResponse
  """

  @type t :: %__MODULE__{
          _links: Mollie.PaymentLinkResponseLinks.t() | nil,
          allowedMethods: [String.t()] | nil,
          amount: Mollie.AmountNullable.t() | nil,
          applicationFee: Mollie.PaymentLinkResponseApplicationFee.t() | nil,
          archived: boolean | nil,
          billingAddress: Mollie.PaymentAddress.t() | nil,
          createdAt: String.t() | nil,
          customerId: String.t() | nil,
          description: String.t() | nil,
          expiresAt: String.t() | nil,
          id: Mollie.PaymentLinkResponseId.t() | nil,
          lines: [map] | nil,
          minimumAmount: Mollie.AmountNullable.t() | nil,
          mode: String.t() | nil,
          paidAt: String.t() | nil,
          profileId: String.t() | nil,
          redirectUrl: String.t() | nil,
          resource: String.t() | nil,
          reusable: boolean | nil,
          sequenceType: String.t() | nil,
          shippingAddress: Mollie.PaymentAddress.t() | nil,
          testmode: boolean | nil,
          webhookUrl: String.t() | nil
        }

  defstruct [
    :_links,
    :allowedMethods,
    :amount,
    :applicationFee,
    :archived,
    :billingAddress,
    :createdAt,
    :customerId,
    :description,
    :expiresAt,
    :id,
    :lines,
    :minimumAmount,
    :mode,
    :paidAt,
    :profileId,
    :redirectUrl,
    :resource,
    :reusable,
    :sequenceType,
    :shippingAddress,
    :testmode,
    :webhookUrl
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.PaymentLinkResponseLinks, :t},
      allowedMethods:
        {:union,
         [
           [
             enum: [
               "applepay",
               "bacs",
               "bancomatpay",
               "bancontact",
               "banktransfer",
               "belfius",
               "billie",
               "blik",
               "creditcard",
               "eps",
               "giftcard",
               "ideal",
               "in3",
               "kbc",
               "klarna",
               "mbway",
               "multibanco",
               "mybank",
               "paybybank",
               "paypal",
               "paysafecard",
               "pointofsale",
               "przelewy24",
               "riverty",
               "satispay",
               "swish",
               "trustly",
               "twint",
               "voucher"
             ]
           ],
           :null
         ]},
      amount: {:union, [{Mollie.AmountNullable, :t}, :null]},
      applicationFee: {Mollie.PaymentLinkResponseApplicationFee, :t},
      archived: :boolean,
      billingAddress: {Mollie.PaymentAddress, :t},
      createdAt: :string,
      customerId: {:union, [:string, :null]},
      description: :string,
      expiresAt: {:union, [:string, :null]},
      id: {Mollie.PaymentLinkResponseId, :t},
      lines: {:union, [[:map], :null]},
      minimumAmount: {:union, [{Mollie.AmountNullable, :t}, :null]},
      mode: {:enum, ["live", "test"]},
      paidAt: {:union, [:string, :null]},
      profileId: {:union, [:string, :null]},
      redirectUrl: {:union, [:string, :null]},
      resource: :string,
      reusable: {:union, [:boolean, :null]},
      sequenceType: {:enum, ["oneoff", "first"]},
      shippingAddress: {Mollie.PaymentAddress, :t},
      testmode: {:union, [:boolean, :null]},
      webhookUrl: {:union, [:string, :null]}
    ]
  end
end
