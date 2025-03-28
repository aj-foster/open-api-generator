defmodule ContextsOrganization do
  @moduledoc """
  Provides struct and type for a ContextsOrganization
  """

  @type t :: %__MODULE__{id: String.t() | nil, slug: String.t() | nil, type: String.t() | nil}

  defstruct [:id, :slug, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, slug: {:string, :generic}, type: {:string, :generic}]
  end
end
