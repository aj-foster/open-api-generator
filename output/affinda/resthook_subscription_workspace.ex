defmodule ResthookSubscriptionWorkspace do
  @moduledoc """
  Provides struct and type for a ResthookSubscriptionWorkspace
  """

  @type t :: %__MODULE__{identifier: String.t(), name: String.t(), organization: Organization.t()}

  defstruct [:identifier, :name, :organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [identifier: {:string, :generic}, name: {:string, :generic}, organization: {Organization, :t}]
  end
end
