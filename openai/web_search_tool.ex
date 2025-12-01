defmodule OpenAI.WebSearchTool do
  @moduledoc """
  Provides struct and type for a WebSearchTool
  """

  @type t :: %__MODULE__{
          search_context_size: String.t() | nil,
          type: String.t(),
          user_location: OpenAI.WebSearchToolUserLocation.t() | nil
        }

  defstruct [:search_context_size, :type, :user_location]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      search_context_size: {:enum, ["low", "medium", "high"]},
      type: {:enum, ["web_search_preview", "web_search_preview_2025_03_11"]},
      user_location: {OpenAI.WebSearchToolUserLocation, :t}
    ]
  end
end
