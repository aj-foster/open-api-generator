defmodule RichMenuBatchProgressResponse do
  @moduledoc """
  Provides struct and type for a RichMenuBatchProgressResponse
  """

  @type t :: %__MODULE__{
          acceptedTime: DateTime.t(),
          completedTime: DateTime.t() | nil,
          phase: String.t()
        }

  defstruct [:acceptedTime, :completedTime, :phase]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      acceptedTime: {:string, :date_time},
      completedTime: {:string, :date_time},
      phase: {:enum, ["ongoing", "succeeded", "failed"]}
    ]
  end
end
