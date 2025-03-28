defmodule InputImage do
  @moduledoc """
  Provides struct and type for a InputImage
  """

  @type t :: %__MODULE__{
          detail: String.t(),
          file_id: String.t() | nil,
          image_url: String.t() | nil,
          type: String.t()
        }

  defstruct [:detail, :file_id, :image_url, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      detail: {:enum, ["high", "low", "auto"]},
      file_id: {:string, :generic},
      image_url: {:string, :generic},
      type: {:const, "input_image"}
    ]
  end
end
