defmodule GetProfileResponseData do
  @moduledoc """
  Provides struct and type for a GetProfileResponseData
  """

  @type t :: %__MODULE__{
          attributes: GetProfileResponseDataAttributes.t() | nil,
          id: String.t() | nil,
          links: ObjectLinks.t() | nil,
          relationships: GetProfileResponseDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {GetProfileResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {GetProfileResponseDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
