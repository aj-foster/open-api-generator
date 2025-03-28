defmodule EmailMarketingListSuppression do
  @moduledoc """
  Provides struct and type for a EmailMarketingListSuppression
  """

  @type t :: %__MODULE__{list_id: String.t(), reason: String.t(), timestamp: DateTime.t()}

  defstruct [:list_id, :reason, :timestamp]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [list_id: {:string, :generic}, reason: {:string, :generic}, timestamp: {:string, :date_time}]
  end
end
