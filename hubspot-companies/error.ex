defmodule Error do
  @moduledoc """
  Provides struct and type for a Error
  """

  @type t :: %__MODULE__{
          category: String.t(),
          context: ErrorContext.t() | nil,
          correlationId: String.t(),
          errors: [ErrorDetail.t()] | nil,
          links: ErrorLinks.t() | nil,
          message: String.t(),
          subCategory: String.t() | nil
        }

  defstruct [:category, :context, :correlationId, :errors, :links, :message, :subCategory]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      category: {:string, :generic},
      context: {ErrorContext, :t},
      correlationId: {:string, :uuid},
      errors: [{ErrorDetail, :t}],
      links: {ErrorLinks, :t},
      message: {:string, :generic},
      subCategory: {:string, :generic}
    ]
  end
end
