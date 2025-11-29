defmodule CampaignRecipientEstimationResponseObjectResourceAttributes do
  @moduledoc """
  Provides struct and type for a CampaignRecipientEstimationResponseObjectResourceAttributes
  """

  @type t :: %__MODULE__{estimated_recipient_count: integer}

  defstruct [:estimated_recipient_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [estimated_recipient_count: :integer]
  end
end
