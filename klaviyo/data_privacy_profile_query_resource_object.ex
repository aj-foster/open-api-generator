defmodule Klaviyo.DataPrivacyProfileQueryResourceObject do
  @moduledoc """
  Provides struct and type for a DataPrivacyProfileQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.DataPrivacyProfileQueryResourceObjectAttributes.t(),
          id: String.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.DataPrivacyProfileQueryResourceObjectAttributes, :t},
      id: :string,
      type: {:const, "profile"}
    ]
  end
end
