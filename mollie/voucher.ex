defmodule Mollie.Voucher do
  @moduledoc """
  Provides struct and type for a Voucher
  """

  @type t :: %__MODULE__{
          _links: Mollie.VoucherLinks.t(),
          contractor: Mollie.VoucherContractor.t(),
          id: String.t(),
          image: Mollie.VoucherImage.t(),
          name: String.t(),
          resource: String.t(),
          status: Mollie.VoucherStatus.t()
        }

  defstruct [:_links, :contractor, :id, :image, :name, :resource, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.VoucherLinks, :t},
      contractor: {Mollie.VoucherContractor, :t},
      id: :string,
      image: {Mollie.VoucherImage, :t},
      name: :string,
      resource: :string,
      status: {Mollie.VoucherStatus, :t}
    ]
  end
end
