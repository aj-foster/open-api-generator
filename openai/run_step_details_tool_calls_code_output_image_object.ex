defmodule RunStepDetailsToolCallsCodeOutputImageObject do
  @moduledoc """
  Provides struct and type for a RunStepDetailsToolCallsCodeOutputImageObject
  """

  @type t :: %__MODULE__{
          image: RunStepDetailsToolCallsCodeOutputImageObjectImage.t(),
          type: String.t()
        }

  defstruct [:image, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [image: {RunStepDetailsToolCallsCodeOutputImageObjectImage, :t}, type: {:const, "image"}]
  end
end
