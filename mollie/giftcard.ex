defmodule Mollie.Giftcard do
  @moduledoc """
  Provides struct and type for a Giftcard
  """

  @type t :: %__MODULE__{
          _links: Mollie.GiftcardLinks.t(),
          description: String.t(),
          id: String.t(),
          resource: String.t(),
          status: Mollie.GiftcardStatus.t()
        }

  defstruct [:_links, :description, :id, :resource, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.GiftcardLinks, :t},
      description: :string,
      id: :string,
      resource: :string,
      status: {Mollie.GiftcardStatus, :t}
    ]
  end
end
