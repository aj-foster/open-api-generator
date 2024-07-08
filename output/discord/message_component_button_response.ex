defmodule MessageComponentButtonResponse do
  @moduledoc """
  Provides struct and type for a MessageComponentButtonResponse
  """

  @type t :: %__MODULE__{
          custom_id: String.t() | nil,
          disabled: boolean | nil,
          emoji: MessageComponentEmojiResponse.t() | nil,
          id: String.t(),
          label: String.t() | nil,
          style: integer,
          type: 2,
          url: String.t() | nil
        }

  defstruct [:custom_id, :disabled, :emoji, :id, :label, :style, :type, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_id: {:union, [{:string, :generic}, :null]},
      disabled: {:union, [:boolean, :null]},
      emoji: {:union, [{MessageComponentEmojiResponse, :t}, :null]},
      id: {:string, :generic},
      label: {:union, [{:string, :generic}, :null]},
      style: :integer,
      type: {:const, 2},
      url: {:union, [{:string, :uri}, :null]}
    ]
  end
end
