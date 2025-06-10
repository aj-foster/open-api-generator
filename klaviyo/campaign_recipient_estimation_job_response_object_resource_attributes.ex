defmodule CampaignRecipientEstimationJobResponseObjectResourceAttributes do
  @moduledoc """
  Provides struct and type for a CampaignRecipientEstimationJobResponseObjectResourceAttributes
  """

  @type t :: %__MODULE__{status: String.t()}

  defstruct [:status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [status: {:enum, ["cancelled", "complete", "processing", "queued"]}]
  end
end
