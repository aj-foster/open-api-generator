defmodule OpenAI.ToolChoiceTypes do
  @moduledoc """
  Provides struct and type for a ToolChoiceTypes
  """

  @type t :: %__MODULE__{type: String.t()}

  defstruct [:type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      type:
        {:enum,
         [
           "file_search",
           "web_search_preview",
           "computer_use_preview",
           "web_search_preview_2025_03_11"
         ]}
    ]
  end
end
