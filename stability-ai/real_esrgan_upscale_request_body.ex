defmodule StabilityAI.RealESRGANUpscaleRequestBody do
  @moduledoc """
  Provides struct and type for a RealESRGANUpscaleRequestBody
  """

  @type t :: %__MODULE__{height: integer | nil, image: binary, width: integer | nil}

  defstruct [:height, :image, :width]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [height: :integer, image: {:string, "binary"}, width: :integer]
  end
end
