defmodule Affinda.OrganizationUpdate do
  @moduledoc """
  Provides struct and type for a OrganizationUpdate
  """

  @type t :: %__MODULE__{
          avatar: binary | nil,
          name: String.t() | nil,
          resthookSignatureKey: String.t() | nil,
          validationToolConfig: Affinda.ValidationToolConfig.t() | nil
        }

  defstruct [:avatar, :name, :resthookSignatureKey, :validationToolConfig]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar: {:string, "binary"},
      name: :string,
      resthookSignatureKey: :string,
      validationToolConfig: {Affinda.ValidationToolConfig, :t}
    ]
  end
end
