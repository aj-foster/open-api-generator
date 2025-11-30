defmodule GitHub.CodeownersErrors do
  @moduledoc """
  Provides struct and type for a CodeownersErrors
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, errors: [GitHub.CodeownersErrorsErrors.t()]}

  defstruct [:__info__, :errors]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [errors: [{GitHub.CodeownersErrorsErrors, :t}]]
  end
end
