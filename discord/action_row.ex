defmodule ActionRow do
  @moduledoc """
  Provides struct and type for a ActionRow
  """

  @type t :: %__MODULE__{
          components: [
            Button.t()
            | ChannelSelect.t()
            | InputText.t()
            | MentionableSelect.t()
            | RoleSelect.t()
            | StringSelect.t()
            | UserSelect.t()
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
          {Button, :t},
          {ChannelSelect, :t},
          {InputText, :t},
          {MentionableSelect, :t},
          {RoleSelect, :t},
          {StringSelect, :t},
          {UserSelect, :t}
        ]
      ],
      id: {:union, [:integer, :null]},
      type: {:const, 1}
    ]
  end
end
