defmodule DefaultKeywordListTriggerMetadataResponse do
  @moduledoc """
  Provides struct and type for a DefaultKeywordListTriggerMetadataResponse
  """

  @type t :: %__MODULE__{allow_list: [String.t()], presets: [integer]}

  defstruct [:allow_list, :presets]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [allow_list: [string: :generic], presets: [:integer]]
  end
end
