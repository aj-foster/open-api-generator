defmodule OrganizationUpdate do
  @moduledoc """
  Provides struct and type for a OrganizationUpdate
  """

  @type t :: %__MODULE__{
          avatar: String.t() | nil,
          name: String.t() | nil,
          resthookSignatureKey: String.t() | nil,
          validationToolConfig: ValidationToolConfig.t() | nil
        }

  defstruct [:avatar, :name, :resthookSignatureKey, :validationToolConfig]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar: {:string, :generic},
      name: {:string, :generic},
      resthookSignatureKey: {:string, :generic},
      validationToolConfig: {ValidationToolConfig, :t}
    ]
  end
end
