defmodule ProjectUserListResponse do
  @moduledoc """
  Provides struct and type for a ProjectUserListResponse
  """

  @type t :: %__MODULE__{
          data: [ProjectUser.t()],
          first_id: String.t(),
          has_more: boolean,
          last_id: String.t(),
          object: String.t()
        }

  defstruct [:data, :first_id, :has_more, :last_id, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{ProjectUser, :t}],
      first_id: {:string, :generic},
      has_more: :boolean,
      last_id: {:string, :generic},
      object: {:string, :generic}
    ]
  end
end
