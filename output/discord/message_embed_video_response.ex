defmodule MessageEmbedVideoResponse do
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
      height: {:union, [:integer, :null]},
      placeholder: {:union, [{:string, :generic}, :null]},
      placeholder_version: {:union, [:integer, :null]},
      proxy_url: {:union, [{:string, :uri}, :null]},
      url: {:union, [{:string, :generic}, :null]},
      width: {:union, [:integer, :null]}
    ]
  end
end
