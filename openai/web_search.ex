defmodule OpenAI.WebSearch do
  @moduledoc """
  Provides struct and type for a WebSearch
  """

  @type t :: %__MODULE__{
          search_context_size: String.t() | nil,
          user_location: OpenAI.WebSearchUserLocation.t() | nil
        }

  defstruct [:search_context_size, :user_location]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      search_context_size: {:enum, ["low", "medium", "high"]},
      user_location: {OpenAI.WebSearchUserLocation, :t}
    ]
  end
end
