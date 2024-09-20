defmodule CampaignCreateQuery do
  @moduledoc """
  Provides struct and type for a CampaignCreateQuery
  """

  @type t :: %__MODULE__{data: CampaignCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CampaignCreateQueryResourceObject, :t}]
  end
end
