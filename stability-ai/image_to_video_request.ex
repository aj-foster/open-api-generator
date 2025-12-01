defmodule StabilityAI.ImageToVideoRequest do
  @moduledoc """
  Provides struct and type for a ImageToVideoRequest
  """

  @type t :: %__MODULE__{
          cfg_scale: number | nil,
          image: binary,
          motion_bucket_id: number | nil,
          seed: number | nil
        }

  defstruct [:cfg_scale, :image, :motion_bucket_id, :seed]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [cfg_scale: :number, image: {:string, "binary"}, motion_bucket_id: :number, seed: :number]
  end
end
