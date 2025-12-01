defmodule OpenAI.MessageContentImageUrlObject do
  @moduledoc """
  Provides struct and type for a MessageContentImageUrlObject
  """

  @type t :: %__MODULE__{
          image_url: OpenAI.MessageContentImageUrlObjectImageUrl.t(),
          type: String.t()
        }

  defstruct [:image_url, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [image_url: {OpenAI.MessageContentImageUrlObjectImageUrl, :t}, type: {:const, "image_url"}]
  end
end
