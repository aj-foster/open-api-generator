defmodule CampaignPartialUpdateQuery do
  @moduledoc """
  Provides struct and type for a CampaignPartialUpdateQuery
  """

  @type t :: %__MODULE__{data: CampaignPartialUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CampaignPartialUpdateQueryResourceObject, :t}]
  end
end
