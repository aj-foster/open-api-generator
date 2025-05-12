defmodule UpdateVectorStoreFileAttributesRequest do
  @moduledoc """
  Provides struct and type for a UpdateVectorStoreFileAttributesRequest
  """

  @type t :: %__MODULE__{attributes: VectorStoreFileAttributes.t()}

  defstruct [:attributes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: {VectorStoreFileAttributes, :t}]
  end
end
