defmodule Klaviyo.PostCampaignValuesResponseDTODataAttributes do
  @moduledoc """
  Provides struct and type for a PostCampaignValuesResponseDTODataAttributes
  """

  @type t :: %__MODULE__{results: [Klaviyo.ValuesData.t()]}

  defstruct [:results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [results: [{Klaviyo.ValuesData, :t}]]
  end
end
