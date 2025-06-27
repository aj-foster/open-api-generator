defmodule PaletteColorOptions do
  @moduledoc """
  Provides struct and type for a PaletteColorOptions
  """

  @type t :: %__MODULE__{
          contrastText: String.t() | nil,
          dark: String.t() | nil,
          light: String.t() | nil,
          main: String.t()
        }

  defstruct [:contrastText, :dark, :light, :main]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      contrastText: {:string, :generic},
      dark: {:string, :generic},
      light: {:string, :generic},
      main: {:string, :generic}
    ]
  end
end
