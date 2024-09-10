defmodule ManyGenres do
  @moduledoc """
  Provides struct and type for a ManyGenres
  """

  @type json_resp :: %__MODULE__{genres: [String.t()]}

  defstruct [:genres]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [genres: [string: :generic]]
  end
end
