defmodule Affinda.CollectionWorkspace do
  @moduledoc """
  Provides struct and type for a CollectionWorkspace
  """

  @type t :: %__MODULE__{
          identifier: String.t() | nil,
          name: String.t() | nil,
          organization: Affinda.Organization.t() | nil
        }

  defstruct [:identifier, :name, :organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [identifier: :string, name: :string, organization: {Affinda.Organization, :t}]
  end
end
