defmodule Discord.ThreadsResponse do
  @moduledoc """
  Provides struct and type for a ThreadsResponse
  """

  @type t :: %__MODULE__{
          has_more: boolean | nil,
          members: [Discord.ThreadMemberResponse.t()],
          threads: [Discord.ThreadResponse.t()]
        }

  defstruct [:has_more, :members, :threads]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      has_more: {:union, [:boolean, :null]},
      members: [{Discord.ThreadMemberResponse, :t}],
      threads: [{Discord.ThreadResponse, :t}]
    ]
  end
end
