defmodule Klaviyo.GetProfileResponseData do
  @moduledoc """
  Provides struct and type for a GetProfileResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.GetProfileResponseDataAttributes.t() | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships: Klaviyo.GetProfileResponseDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.GetProfileResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.GetProfileResponseDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
