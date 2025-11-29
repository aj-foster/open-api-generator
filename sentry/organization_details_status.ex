defmodule OrganizationDetailsStatus do
  @moduledoc """
  Provides struct and type for a OrganizationDetailsStatus
  """

  @type t :: %__MODULE__{id: String.t() | nil, name: String.t() | nil}

  defstruct [:id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, name: {:string, :generic}]
  end
end
