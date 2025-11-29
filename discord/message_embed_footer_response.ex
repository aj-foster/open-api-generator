defmodule MessageEmbedFooterResponse do
  @moduledoc """
  Provides struct and type for a MessageEmbedFooterResponse
  """

  @type t :: %__MODULE__{
          icon_url: String.t() | nil,
          proxy_icon_url: String.t() | nil,
          text: String.t()
        }

  defstruct [:icon_url, :proxy_icon_url, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      icon_url: {:union, [{:string, :generic}, :null]},
      proxy_icon_url: {:union, [{:string, :uri}, :null]},
      text: {:string, :generic}
    ]
  end
end
