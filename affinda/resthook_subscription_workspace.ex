defmodule Affinda.ResthookSubscriptionWorkspace do
  @moduledoc """
  Provides struct and type for a ResthookSubscriptionWorkspace
  """

  @type t :: %__MODULE__{
          identifier: String.t(),
          name: String.t(),
          organization: Affinda.Organization.t()
        }

  defstruct [:identifier, :name, :organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [identifier: :string, name: :string, organization: {Affinda.Organization, :t}]
  end
end
