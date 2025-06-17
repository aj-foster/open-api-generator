defmodule OrganizationEventContextSession do
  @moduledoc """
  Provides struct and type for a OrganizationEventContextSession
  """

  @type t :: %__MODULE__{foo: String.t() | nil}

  defstruct [:foo]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [foo: {:string, :generic}]
  end
end
