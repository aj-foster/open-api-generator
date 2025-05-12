defmodule Organization do
  @moduledoc """
  Provides struct and type for a Organization
  """

  @type t :: %__MODULE__{
          avatar: String.t() | nil,
          identifier: String.t() | nil,
          isTrial: boolean | nil,
          name: String.t() | nil,
          resthookSignatureKey: String.t() | nil,
          showCustomFieldCreation: boolean | nil,
          userRole: String.t() | nil,
          validationToolConfig: OrganizationValidationToolConfig.t() | nil
        }

  defstruct [
    :avatar,
    :identifier,
    :isTrial,
    :name,
    :resthookSignatureKey,
    :showCustomFieldCreation,
    :userRole,
    :validationToolConfig
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar: {:string, :generic},
      identifier: {:string, :generic},
      isTrial: :boolean,
      name: {:string, :generic},
      resthookSignatureKey: {:string, :generic},
      showCustomFieldCreation: :boolean,
      userRole: {:string, :generic},
      validationToolConfig: {OrganizationValidationToolConfig, :t}
    ]
  end
end
