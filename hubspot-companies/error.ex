defmodule HubSpot.Companies.Error do
  @moduledoc """
  Provides struct and type for a Error
  """

  @type t :: %__MODULE__{
          category: String.t(),
          context: map | nil,
          correlationId: String.t(),
          errors: [HubSpot.Companies.ErrorDetail.t()] | nil,
          links: map | nil,
          message: String.t(),
          subCategory: String.t() | nil
        }

  defstruct [:category, :context, :correlationId, :errors, :links, :message, :subCategory]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      category: :string,
      context: :map,
      correlationId: {:string, "uuid"},
      errors: [{HubSpot.Companies.ErrorDetail, :t}],
      links: :map,
      message: :string,
      subCategory: :string
    ]
  end
end
