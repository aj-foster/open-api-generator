defmodule ErrorDetail do
  @moduledoc """
  Provides struct and type for a ErrorDetail
  """

  @type t :: %__MODULE__{
          code: String.t() | nil,
          context: ErrorDetailContext.t() | nil,
          in: String.t() | nil,
          message: String.t(),
          subCategory: String.t() | nil
        }

  defstruct [:code, :context, :in, :message, :subCategory]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:string, :generic},
      context: {ErrorDetailContext, :t},
      in: {:string, :generic},
      message: {:string, :generic},
      subCategory: {:string, :generic}
    ]
  end
end
