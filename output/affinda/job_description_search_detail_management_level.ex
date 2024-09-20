defmodule JobDescriptionSearchDetailManagementLevel do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailManagementLevel
  """

  @type t :: %__MODULE__{level: String.t() | nil, match: boolean | nil}

  defstruct [:level, :match]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [level: {:enum, ["None", "Low", "Mid", "Upper"]}, match: :boolean]
  end
end
