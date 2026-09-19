defmodule OpenAI.ImagesResponse do
  @moduledoc """
  Provides struct and type for a ImagesResponse
  """

  @type t :: %__MODULE__{created: integer, data: [OpenAI.Image.t()]}

  defstruct [:created, :data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created: :integer, data: [{OpenAI.Image, :t}]]
  end
end
