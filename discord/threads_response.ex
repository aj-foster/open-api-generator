defmodule ThreadsResponse do
  @moduledoc """
  Provides struct and type for a ThreadsResponse
  """

  @type t :: %__MODULE__{
          has_more: boolean | nil,
          members: [ThreadMemberResponse.t()],
          threads: [ThreadResponse.t()]
        }

  defstruct [:has_more, :members, :threads]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      has_more: {:union, [:boolean, :null]},
      members: [{ThreadMemberResponse, :t}],
      threads: [{ThreadResponse, :t}]
    ]
  end
end
