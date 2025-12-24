defmodule OpenAI.ComputerScreenshotImage do
  @moduledoc """
  Provides struct and type for a ComputerScreenshotImage
  """

  @type t :: %__MODULE__{file_id: String.t() | nil, image_url: String.t() | nil, type: String.t()}

  defstruct [:file_id, :image_url, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [file_id: :string, image_url: :string, type: {:const, "computer_screenshot"}]
  end
end
