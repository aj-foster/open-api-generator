defmodule GitHub.Organization.ProgrammaticAccessGrant.PermissionsOther do
  @moduledoc """
  Provides struct and type for a Organization.ProgrammaticAccessGrant.PermissionsOther
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map}

  defstruct [:__info__]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    []
  end
end
