defmodule MessageEmbedAuthorResponse do
  @moduledoc """
  Provides struct and type for a MessageEmbedAuthorResponse
  """

  @type t :: %__MODULE__{
          icon_url: String.t() | nil,
          name: String.t(),
          proxy_icon_url: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:icon_url, :name, :proxy_icon_url, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      icon_url: {:union, [{:string, :generic}, :null]},
      name: {:string, :generic},
      proxy_icon_url: {:union, [{:string, :uri}, :null]},
      url: {:union, [{:string, :generic}, :null]}
    ]
  end
end
