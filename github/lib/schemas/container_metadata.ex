defmodule GitHub.ContainerMetadata do
  @moduledoc """
  Provides struct and type for a ContainerMetadata
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, tags: [String.t()]}

  defstruct [:__info__, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tags: [string: :generic]]
  end
end
