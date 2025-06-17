defmodule CampaignMessagePartialUpdateQuery do
  @moduledoc """
  Provides struct and type for a CampaignMessagePartialUpdateQuery
  """

  @type t :: %__MODULE__{data: CampaignMessagePartialUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CampaignMessagePartialUpdateQueryResourceObject, :t}]
  end
end
