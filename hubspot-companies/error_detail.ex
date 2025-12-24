defmodule HubSpot.Companies.ErrorDetail do
  @moduledoc """
  Provides struct and type for a ErrorDetail
  """

  @type t :: %__MODULE__{
          code: String.t() | nil,
          context: map | nil,
          in: String.t() | nil,
          message: String.t(),
          subCategory: String.t() | nil
        }

  defstruct [:code, :context, :in, :message, :subCategory]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :string, context: :map, in: :string, message: :string, subCategory: :string]
  end
end
