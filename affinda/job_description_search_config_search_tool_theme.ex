defmodule JobDescriptionSearchConfigSearchToolTheme do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchConfigSearchToolTheme
  """

  @type t :: %__MODULE__{
          borderRadius: number | nil,
          fontUrl: String.t() | nil,
          palette: map | nil,
          typography: map | nil
        }

  defstruct [:borderRadius, :fontUrl, :palette, :typography]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [borderRadius: :number, fontUrl: {:string, :generic}, palette: :map, typography: :map]
  end
end
