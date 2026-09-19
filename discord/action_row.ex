defmodule Discord.ActionRow do
  @moduledoc """
  Provides struct and type for a ActionRow
  """

  @type t :: %__MODULE__{
          components: [
            Discord.Button.t()
            | Discord.ChannelSelect.t()
            | Discord.InputText.t()
            | Discord.MentionableSelect.t()
            | Discord.RoleSelect.t()
            | Discord.StringSelect.t()
            | Discord.UserSelect.t()
          ],
          id: integer | nil,
          type: 1
        }

  defstruct [:components, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      components: [
        union: [
          {Discord.Button, :t},
          {Discord.ChannelSelect, :t},
          {Discord.InputText, :t},
          {Discord.MentionableSelect, :t},
          {Discord.RoleSelect, :t},
          {Discord.StringSelect, :t},
          {Discord.UserSelect, :t}
        ]
      ],
      id: {:union, [{:integer, "int64"}, :null]},
      type: {:const, 1}
    ]
  end
end
