defmodule Discord.MessageEmbedVideoResponse do
  @moduledoc """
  Provides struct and type for a MessageEmbedVideoResponse
  """

  @type t :: %__MODULE__{
          height: integer | nil,
          placeholder: String.t() | nil,
          placeholder_version: integer | nil,
          proxy_url: String.t() | nil,
          url: String.t() | nil,
          width: integer | nil
        }

  defstruct [:height, :placeholder, :placeholder_version, :proxy_url, :url, :width]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      height: {:union, [{:integer, "int64"}, :null]},
      placeholder: {:union, [:string, :null]},
      placeholder_version: {:union, [{:integer, "int64"}, :null]},
      proxy_url: {:union, [{:string, "uri"}, :null]},
      url: {:union, [:string, :null]},
      width: {:union, [{:integer, "int64"}, :null]}
    ]
  end
end
