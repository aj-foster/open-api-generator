defmodule CampaignSendJobPartialUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CampaignSendJobPartialUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{action: String.t()}

  defstruct [:action]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [action: {:string, :generic}]
  end
end
