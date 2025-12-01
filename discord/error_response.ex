defmodule Discord.ErrorResponse do
  @moduledoc """
  Provides struct and type for a ErrorResponse
  """

  @type t :: %__MODULE__{
          code: integer | nil,
          errors: map | Discord.InnerErrors.t() | nil,
          message: String.t() | nil
        }

  defstruct [:code, :errors, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :integer, errors: {:union, [:map, {Discord.InnerErrors, :t}]}, message: :string]
  end
end
