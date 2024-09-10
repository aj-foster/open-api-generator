defmodule CampaignValuesRequestDTO do
  @moduledoc """
  Provides struct and type for a CampaignValuesRequestDTO
  """

  @type t :: %__MODULE__{data: CampaignValuesRequestDTOResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CampaignValuesRequestDTOResourceObject, :t}]
  end
end
