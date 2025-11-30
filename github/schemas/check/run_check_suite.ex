defmodule GitHub.Check.RunCheckSuite do
  @moduledoc """
  Provides struct and type for a Check.RunCheckSuite
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, id: integer}

  defstruct [:__info__, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :integer]
  end
end
