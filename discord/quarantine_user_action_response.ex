defmodule QuarantineUserActionResponse do
  @moduledoc """
  Provides struct and type for a QuarantineUserActionResponse
  """

  @type t :: %__MODULE__{metadata: map, type: 4}

  defstruct [:metadata, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: :map, type: {:const, 4}]
  end
end
