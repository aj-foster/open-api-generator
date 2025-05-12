defmodule YearsExperienceAnnotationParsed do
  @moduledoc """
  Provides struct and type for a YearsExperienceAnnotationParsed
  """

  @type t :: %__MODULE__{maximum: number | nil, minimum: number | nil}

  defstruct [:maximum, :minimum]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [maximum: :number, minimum: :number]
  end
end
