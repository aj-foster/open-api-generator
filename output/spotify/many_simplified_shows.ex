defmodule ManySimplifiedShows do
  @moduledoc """
  Provides struct and type for a ManySimplifiedShows
  """

  @type json_resp :: %__MODULE__{shows: [SimplifiedShowObject.t()]}

  defstruct [:shows]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [shows: [{SimplifiedShowObject, :t}]]
  end
end
