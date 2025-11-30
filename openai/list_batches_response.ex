defmodule OpenAI.ListBatchesResponse do
  @moduledoc """
  Provides struct and type for a ListBatchesResponse
  """

  @type t :: %__MODULE__{
          data: [OpenAI.Batch.t()],
          first_id: String.t() | nil,
          has_more: boolean,
          last_id: String.t() | nil,
          object: String.t()
        }

  defstruct [:data, :first_id, :has_more, :last_id, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{OpenAI.Batch, :t}],
      first_id: :string,
      has_more: :boolean,
      last_id: :string,
      object: {:const, "list"}
    ]
  end
end
