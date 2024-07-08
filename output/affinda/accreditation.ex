defmodule Accreditation do
  @moduledoc """
  Provides struct and type for a Accreditation
  """

  @type t :: %__MODULE__{
          education: String.t() | nil,
          educationLevel: String.t() | nil,
          inputStr: String.t() | nil,
          matchStr: String.t() | nil
        }

  defstruct [:education, :educationLevel, :inputStr, :matchStr]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      education: {:string, :generic},
      educationLevel: {:string, :generic},
      inputStr: {:string, :generic},
      matchStr: {:string, :generic}
    ]
  end
end
