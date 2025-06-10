defmodule WidgetMember do
  @moduledoc """
  Provides struct and type for a WidgetMember
  """

  @type t :: %__MODULE__{
          activity: WidgetActivity.t() | nil,
          avatar: nil,
          avatar_url: String.t(),
          channel_id: String.t() | nil,
          deaf: boolean | nil,
          discriminator: String.t(),
          id: String.t(),
          mute: boolean | nil,
          self_deaf: boolean | nil,
          self_mute: boolean | nil,
          status: String.t(),
          suppress: boolean | nil,
          username: String.t()
        }

  defstruct [
    :activity,
    :avatar,
    :avatar_url,
    :channel_id,
    :deaf,
    :discriminator,
    :id,
    :mute,
    :self_deaf,
    :self_mute,
    :status,
    :suppress,
    :username
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      activity: {:union, [{WidgetActivity, :t}, :null]},
      avatar: :null,
      avatar_url: {:string, :uri},
      channel_id: {:union, [{:string, :generic}, :null]},
      deaf: {:union, [:boolean, :null]},
      discriminator: {:string, :generic},
      id: {:string, :generic},
      mute: {:union, [:boolean, :null]},
      self_deaf: {:union, [:boolean, :null]},
      self_mute: {:union, [:boolean, :null]},
      status: {:string, :generic},
      suppress: {:union, [:boolean, :null]},
      username: {:string, :generic}
    ]
  end
end
