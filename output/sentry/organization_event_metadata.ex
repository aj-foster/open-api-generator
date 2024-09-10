defmodule OrganizationEventMetadata do
  @moduledoc """
  Provides struct and type for a OrganizationEventMetadata
  """

  @type t :: %__MODULE__{title: String.t() | nil}

  defstruct [:title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [title: {:string, :generic}]
  end
end
