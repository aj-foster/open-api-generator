defmodule GitHub.Repository.Rule.NonFastForward do
  @moduledoc """
  Provides struct and type for a Repository.Rule.NonFastForward
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, type: String.t()}

  defstruct [:__info__, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "non_fast_forward"}]
  end
end
