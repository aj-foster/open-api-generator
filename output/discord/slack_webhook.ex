defmodule SlackWebhook do
  @moduledoc """
  Provides struct and type for a SlackWebhook
  """

  @type t :: %__MODULE__{
          attachments: [map] | nil,
          icon_url: String.t() | nil,
          text: String.t() | nil,
          username: String.t() | nil
        }

  defstruct [:attachments, :icon_url, :text, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attachments: {:union, [[:map], :null]},
      icon_url: {:union, [{:string, :uri}, :null]},
      text: {:union, [{:string, :generic}, :null]},
      username: {:union, [{:string, :generic}, :null]}
    ]
  end
end
