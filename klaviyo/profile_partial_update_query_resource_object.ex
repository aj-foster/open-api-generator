defmodule Klaviyo.ProfilePartialUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ProfilePartialUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.ProfilePartialUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          meta: Klaviyo.ProfileMeta.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :meta, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.ProfilePartialUpdateQueryResourceObjectAttributes, :t},
      id: :string,
      meta: {Klaviyo.ProfileMeta, :t},
      type: {:const, "profile"}
    ]
  end
end
