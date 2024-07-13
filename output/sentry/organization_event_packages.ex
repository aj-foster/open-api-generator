defmodule OrganizationEventPackages do
  @moduledoc """
  Provides struct and type for a OrganizationEventPackages
  """

  @type t :: %__MODULE__{"my.package": String.t() | nil}

  defstruct [:"my.package"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    ["my.package": {:string, :generic}]
  end
end
