defmodule Image do
  @moduledoc """
  Provides struct and type for a Image
  """

  @type t :: %__MODULE__{
          base64: String.t() | nil,
          finishReason: String.t() | nil,
          seed: number | nil
        }

  defstruct [:base64, :finishReason, :seed]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      base64: {:string, :generic},
      finishReason: {:enum, ["SUCCESS", "ERROR", "CONTENT_FILTERED"]},
      seed: :number
    ]
  end
end
