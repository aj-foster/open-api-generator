defmodule GitHub.Organization.FineGrainedPermission do
  @moduledoc """
  Provides struct and type for a Organization.FineGrainedPermission
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, description: String.t(), name: String.t()}

  defstruct [:__info__, :description, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: {:string, :generic}, name: {:string, :generic}]
  end
end
