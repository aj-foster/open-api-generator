defmodule OpenAI.ListRunsResponse do
  @moduledoc """
  Provides struct and type for a ListRunsResponse
  """

  @type t :: %__MODULE__{
          data: [OpenAI.RunObject.t()],
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
      data: [{OpenAI.RunObject, :t}],
      first_id: :string,
      has_more: :boolean,
      last_id: :string,
      object: :string
    ]
  end
end
