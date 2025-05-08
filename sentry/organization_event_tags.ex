defmodule OrganizationEventTags do
  @moduledoc """
  Provides struct and type for a OrganizationEventTags
  """

  @type t :: %__MODULE__{_meta: String.t() | nil, key: String.t() | nil, value: String.t() | nil}

  defstruct [:_meta, :key, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [_meta: {:string, :generic}, key: {:string, :generic}, value: {:string, :generic}]
  end
end
