defmodule Mollie.EntityChargebackReason do
  @moduledoc """
  Provides struct and type for a EntityChargebackReason
  """

  @type t :: %__MODULE__{code: String.t(), description: String.t()}

  defstruct [:code, :description]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :string, description: :string]
  end
end
