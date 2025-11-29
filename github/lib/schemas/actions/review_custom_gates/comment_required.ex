defmodule GitHub.Actions.ReviewCustomGates.CommentRequired do
  @moduledoc """
  Provides struct and type for a Actions.ReviewCustomGates.CommentRequired
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, comment: String.t(), environment_name: String.t()}

  defstruct [:__info__, :comment, :environment_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [comment: {:string, :generic}, environment_name: {:string, :generic}]
  end
end
