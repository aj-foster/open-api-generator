defmodule CampaignCloneQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CampaignCloneQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{new_name: String.t() | nil}

  defstruct [:new_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [new_name: {:string, :generic}]
  end
end
