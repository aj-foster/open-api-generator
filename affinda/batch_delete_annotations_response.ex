defmodule BatchDeleteAnnotationsResponse do
  @moduledoc """
  Provides struct and type for a BatchDeleteAnnotationsResponse
  """

  @type t :: %__MODULE__{validationResults: map | nil}

  defstruct [:validationResults]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [validationResults: :map]
  end
end
