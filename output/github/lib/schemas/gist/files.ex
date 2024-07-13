defmodule GitHub.Gist.Files do
  @moduledoc """
  Provides struct and types for a Gist.Files
  """
  use GitHub.Encoder

  @type simple :: %__MODULE__{__info__: map}

  @type t :: %__MODULE__{__info__: map}

  defstruct [:__info__]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:simple) do
    []
  end

  def __fields__(:t) do
    []
  end
end
