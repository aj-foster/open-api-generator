defmodule RequestError do
  @moduledoc """
  Provides struct and type for a RequestError
  """

  @type t :: %__MODULE__{errors: [RequestErrorErrors.t()], type: String.t()}

  defstruct [:errors, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [errors: [{RequestErrorErrors, :t}], type: {:string, :generic}]
  end
end
