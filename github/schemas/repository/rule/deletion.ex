defmodule GitHub.Repository.Rule.Deletion do
  @moduledoc """
  Provides struct and type for a Repository.Rule.Deletion
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, type: String.t()}

  defstruct [:__info__, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "deletion"}]
  end
end
