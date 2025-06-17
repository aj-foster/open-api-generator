defmodule PatchTagGroupResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PatchTagGroupResponseDataAttributes
  """

  @type t :: %__MODULE__{default: boolean, exclusive: boolean, name: String.t()}

  defstruct [:default, :exclusive, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [default: :boolean, exclusive: :boolean, name: {:string, :generic}]
  end
end
