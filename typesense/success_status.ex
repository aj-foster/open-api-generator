defmodule SuccessStatus do
  @moduledoc """
  Provides struct and type for a SuccessStatus
  """

  @type t :: %__MODULE__{success: boolean}

  defstruct [:success]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [success: :boolean]
  end
end
