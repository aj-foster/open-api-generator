defmodule Klaviyo.TagCampaignOp do
  @moduledoc """
  Provides struct and type for a TagCampaignOp
  """

  @type t :: %__MODULE__{data: [Klaviyo.TagCampaignOpData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.TagCampaignOpData, :t}]]
  end
end
