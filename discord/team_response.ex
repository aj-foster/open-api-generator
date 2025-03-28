defmodule TeamResponse do
  @moduledoc """
  Provides struct and type for a TeamResponse
  """

  @type t :: %__MODULE__{
          icon: String.t() | nil,
          id: String.t(),
          members: [TeamMemberResponse.t()],
          name: String.t(),
          owner_user_id: String.t()
        }

  defstruct [:icon, :id, :members, :name, :owner_user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      icon: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      members: [{TeamMemberResponse, :t}],
      name: {:string, :generic},
      owner_user_id: {:string, :generic}
    ]
  end
end
