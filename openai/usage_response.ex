defmodule OpenAI.UsageResponse do
  @moduledoc """
  Provides struct and type for a UsageResponse
  """

  @type t :: %__MODULE__{
          data: [OpenAI.UsageTimeBucket.t()],
          has_more: boolean,
          next_page: String.t(),
          object: String.t()
        }

  defstruct [:data, :has_more, :next_page, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{OpenAI.UsageTimeBucket, :t}],
      has_more: :boolean,
      next_page: :string,
      object: {:const, "page"}
    ]
  end
end
