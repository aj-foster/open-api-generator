defmodule Mollie.ErrorResponse do
  @moduledoc """
  Provides struct and type for a ErrorResponse
  """

  @type t :: %__MODULE__{
          _links: Mollie.ErrorResponseLinks.t(),
          detail: String.t(),
          field: String.t() | nil,
          status: integer,
          title: String.t()
        }

  defstruct [:_links, :detail, :field, :status, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.ErrorResponseLinks, :t},
      detail: :string,
      field: :string,
      status: :integer,
      title: :string
    ]
  end
end
