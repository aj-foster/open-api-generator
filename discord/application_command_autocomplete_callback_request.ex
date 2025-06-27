defmodule ApplicationCommandAutocompleteCallbackRequest do
  @moduledoc """
  Provides struct and type for a ApplicationCommandAutocompleteCallbackRequest
  """

  @type t :: %__MODULE__{
          data:
            InteractionApplicationCommandAutocompleteCallbackIntegerData.t()
            | InteractionApplicationCommandAutocompleteCallbackNumberData.t()
            | InteractionApplicationCommandAutocompleteCallbackStringData.t(),
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
           {InteractionApplicationCommandAutocompleteCallbackIntegerData, :t},
           {InteractionApplicationCommandAutocompleteCallbackNumberData, :t},
           {InteractionApplicationCommandAutocompleteCallbackStringData, :t}
         ]},
      type: {:const, 8}
    ]
  end
end
