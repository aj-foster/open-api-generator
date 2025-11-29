defmodule SimplePublicObjectInput do
  @moduledoc """
  Provides struct and type for a SimplePublicObjectInput
  """

  @type t :: %__MODULE__{properties: SimplePublicObjectInputProperties.t()}

  defstruct [:properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [properties: {SimplePublicObjectInputProperties, :t}]
  end
end
