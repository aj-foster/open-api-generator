defmodule GitHub.Blob do
  @moduledoc """
  Provides struct and type for a Blob
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          content: String.t(),
          encoding: String.t(),
          highlighted_content: String.t() | nil,
          node_id: String.t(),
          sha: String.t(),
          size: integer | nil,
          url: String.t()
        }

  defstruct [:__info__, :content, :encoding, :highlighted_content, :node_id, :sha, :size, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: {:string, :generic},
      encoding: {:string, :generic},
      highlighted_content: {:string, :generic},
      node_id: {:string, :generic},
      sha: {:string, :generic},
      size: {:union, [:integer, :null]},
      url: {:string, :uri}
    ]
  end
end
