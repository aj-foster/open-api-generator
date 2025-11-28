defmodule PostTemplateResponse do
  @moduledoc """
  Provides struct and type for a PostTemplateResponse
  """

  @type t :: %__MODULE__{data: PostTemplateResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostTemplateResponseData, :t}]
  end
end
