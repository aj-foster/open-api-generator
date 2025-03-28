defmodule EntityMetadataExternalResponse do
  @moduledoc """
  Provides struct and type for a EntityMetadataExternalResponse
  """

  @type t :: %__MODULE__{location: String.t()}

  defstruct [:location]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [location: {:string, :generic}]
  end
end
