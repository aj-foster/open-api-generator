defmodule Discord.DefaultKeywordListTriggerMetadata do
  @moduledoc """
  Provides struct and type for a DefaultKeywordListTriggerMetadata
  """

  @type t :: %__MODULE__{allow_list: [String.t()] | nil, presets: [integer] | nil}

  defstruct [:allow_list, :presets]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [allow_list: {:union, [[:string], :null]}, presets: {:union, [[integer: "int32"], :null]}]
  end
end
