defmodule PostProfileImportJobResponse do
  @moduledoc """
  Provides struct and type for a PostProfileImportJobResponse
  """

  @type t :: %__MODULE__{data: PostProfileImportJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostProfileImportJobResponseData, :t}]
  end
end
