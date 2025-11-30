defmodule Discord.ApplicationCommandAutocompleteCallbackRequest do
  @moduledoc """
  Provides struct and type for a ApplicationCommandAutocompleteCallbackRequest
  """

  @type t :: %__MODULE__{
          data:
            Discord.InteractionApplicationCommandAutocompleteCallbackIntegerData.t()
            | Discord.InteractionApplicationCommandAutocompleteCallbackNumberData.t()
            | Discord.InteractionApplicationCommandAutocompleteCallbackStringData.t(),
          type: 8
        }

  defstruct [:data, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data:
        {:union,
         [
           {Discord.InteractionApplicationCommandAutocompleteCallbackIntegerData, :t},
           {Discord.InteractionApplicationCommandAutocompleteCallbackNumberData, :t},
           {Discord.InteractionApplicationCommandAutocompleteCallbackStringData, :t}
         ]},
      type: {:const, 8}
    ]
  end
end
