defmodule ListMessagesResponse do
  @moduledoc """
  Provides struct and type for a ListMessagesResponse
  """

  @type t :: %__MODULE__{
          data: [MessageObject.t()],
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
      data: [{MessageObject, :t}],
      first_id: {:string, :generic},
      has_more: :boolean,
      last_id: {:string, :generic},
      object: {:string, :generic}
    ]
  end
end
