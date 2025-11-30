defmodule Mollie.VoucherImage do
  @moduledoc """
  Provides struct and type for a VoucherImage
  """

  @type t :: %__MODULE__{
          size1x: String.t() | nil,
          size2x: String.t() | nil,
          svg: String.t() | nil
        }

  defstruct [:size1x, :size2x, :svg]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [size1x: :string, size2x: :string, svg: :string]
  end
end
