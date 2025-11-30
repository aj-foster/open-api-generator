defmodule Mollie.EntityTerminal do
  @moduledoc """
  Provides struct and type for a EntityTerminal
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityTerminalLinks.t(),
          brand: String.t(),
          createdAt: String.t(),
          currency: String.t(),
          description: String.t(),
          id: Mollie.EntityTerminalId.t(),
          mode: String.t(),
          model: String.t(),
          profileId: String.t(),
          resource: String.t(),
          serialNumber: String.t() | nil,
          status: Mollie.EntityTerminalStatus.t(),
          updatedAt: String.t()
        }

  defstruct [
    :_links,
    :brand,
    :createdAt,
    :currency,
    :description,
    :id,
    :mode,
    :model,
    :profileId,
    :resource,
    :serialNumber,
    :status,
    :updatedAt
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntityTerminalLinks, :t},
      brand: {:enum, ["PAX", "Tap"]},
      createdAt: :string,
      currency: :string,
      description: :string,
      id: {Mollie.EntityTerminalId, :t},
      mode: {:enum, ["live", "test"]},
      model: {:enum, ["A35", "A77", "A920", "A920Pro", "IM30", "Tap"]},
      profileId: :string,
      resource: :string,
      serialNumber: {:union, [:string, :null]},
      status: {Mollie.EntityTerminalStatus, :t},
      updatedAt: :string
    ]
  end
end
