defmodule Affinda.Organization do
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
          validationToolConfig: Affinda.OrganizationValidationToolConfig.t() | nil
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
      avatar: :string,
      identifier: :string,
      isTrial: :boolean,
      name: :string,
      resthookSignatureKey: :string,
      showCustomFieldCreation: :boolean,
      userRole: :string,
      validationToolConfig: {Affinda.OrganizationValidationToolConfig, :t}
    ]
  end
end
