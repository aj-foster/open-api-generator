defmodule ImageObject do
  @moduledoc """
  Provides struct and type for a ImageObject
  """

  @type t :: %__MODULE__{height: integer | nil, url: String.t(), width: integer | nil}

  defstruct [:height, :url, :width]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [height: :integer, url: {:string, :generic}, width: :integer]
  end
end
