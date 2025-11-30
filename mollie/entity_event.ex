defmodule Mollie.EntityEvent do
  @moduledoc """
  Provides struct and type for a EntityEvent
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityEventLinks.t() | nil,
          createdAt: String.t(),
          message: String.t(),
          resource: String.t(),
          type: integer
        }

  defstruct [:_links, :createdAt, :message, :resource, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntityEventLinks, :t},
      createdAt: {:string, :generic},
      message: {:string, :generic},
      resource: {:string, :generic},
      type: :integer
    ]
  end
end
