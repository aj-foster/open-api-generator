defmodule GitHub.Repository.Rule.RequiredLinearHistory do
  @moduledoc """
  Provides struct and type for a Repository.Rule.RequiredLinearHistory
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, type: String.t()}

  defstruct [:__info__, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "required_linear_history"}]
  end
end
