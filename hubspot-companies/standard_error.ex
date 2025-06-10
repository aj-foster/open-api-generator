defmodule StandardError do
  @moduledoc """
  Provides struct and type for a StandardError
  """

  @type t :: %__MODULE__{
          category: String.t(),
          context: StandardErrorContext.t(),
          errors: [ErrorDetail.t()],
          id: String.t() | nil,
          links: StandardErrorLinks.t(),
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
      category: {:string, :generic},
      context: {StandardErrorContext, :t},
      errors: [{ErrorDetail, :t}],
      id: {:string, :generic},
      links: {StandardErrorLinks, :t},
      message: {:string, :generic},
      status: {:string, :generic},
      subCategory: :map
    ]
  end
end
