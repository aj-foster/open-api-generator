defmodule MessageComponentActionRowResponse do
  @moduledoc """
  Provides struct and type for a MessageComponentActionRowResponse
  """

  @type t :: %__MODULE__{
          components:
            [
              MessageComponentButtonResponse.t()
              | MessageComponentChannelSelectResponse.t()
              | MessageComponentInputTextResponse.t()
              | MessageComponentMentionableSelectResponse.t()
              | MessageComponentRoleSelectResponse.t()
              | MessageComponentStringSelectResponse.t()
              | MessageComponentUserSelectResponse.t()
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
               {MessageComponentButtonResponse, :t},
               {MessageComponentChannelSelectResponse, :t},
               {MessageComponentInputTextResponse, :t},
               {MessageComponentMentionableSelectResponse, :t},
               {MessageComponentRoleSelectResponse, :t},
               {MessageComponentStringSelectResponse, :t},
               {MessageComponentUserSelectResponse, :t}
             ]
           ],
           :null
         ]},
      id: {:string, :generic},
      type: {:const, 1}
    ]
  end
end
