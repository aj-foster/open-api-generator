defmodule HubSpot.Companies.StandardError do
  @moduledoc """
  Provides struct and type for a StandardError
  """

  @type t :: %__MODULE__{
          category: String.t(),
          context: map,
          errors: [HubSpot.Companies.ErrorDetail.t()],
          id: String.t() | nil,
          links: map,
          message: String.t(),
          status: String.t(),
          subCategory: map | nil
        }

  defstruct [:category, :context, :errors, :id, :links, :message, :status, :subCategory]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      category: :string,
      context: :map,
      errors: [{HubSpot.Companies.ErrorDetail, :t}],
      id: :string,
      links: :map,
      message: :string,
      status: :string,
      subCategory: :map
    ]
  end
end
