defmodule Discord.MessageComponentActionRowResponse do
  @moduledoc """
  Provides struct and type for a MessageComponentActionRowResponse
  """

  @type t :: %__MODULE__{
          components:
            [
              Discord.MessageComponentButtonResponse.t()
              | Discord.MessageComponentChannelSelectResponse.t()
              | Discord.MessageComponentInputTextResponse.t()
              | Discord.MessageComponentMentionableSelectResponse.t()
              | Discord.MessageComponentRoleSelectResponse.t()
              | Discord.MessageComponentStringSelectResponse.t()
              | Discord.MessageComponentUserSelectResponse.t()
            ]
            | nil,
          id: String.t(),
          type: 1
        }

  defstruct [:components, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      components:
        {:union,
         [
           [
             union: [
               {Discord.MessageComponentButtonResponse, :t},
               {Discord.MessageComponentChannelSelectResponse, :t},
               {Discord.MessageComponentInputTextResponse, :t},
               {Discord.MessageComponentMentionableSelectResponse, :t},
               {Discord.MessageComponentRoleSelectResponse, :t},
               {Discord.MessageComponentStringSelectResponse, :t},
               {Discord.MessageComponentUserSelectResponse, :t}
             ]
           ],
           :null
         ]},
      id: {:string, "snowflake"},
      type: {:const, 1}
    ]
  end
end
