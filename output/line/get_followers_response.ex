defmodule GetFollowersResponse do
  @moduledoc """
  Provides struct and type for a GetFollowersResponse
  """

  @type t :: %__MODULE__{next: String.t() | nil, userIds: [String.t()]}

  defstruct [:next, :userIds]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [next: {:string, :generic}, userIds: [string: :generic]]
  end
end
