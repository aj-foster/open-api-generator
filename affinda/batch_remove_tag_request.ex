defmodule BatchRemoveTagRequest do
  @moduledoc """
  Provides struct and type for a BatchRemoveTagRequest
  """

  @type t :: %__MODULE__{identifiers: [String.t()] | nil, tag: integer | nil}

  defstruct [:identifiers, :tag]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [identifiers: [string: :generic], tag: :integer]
  end
end
