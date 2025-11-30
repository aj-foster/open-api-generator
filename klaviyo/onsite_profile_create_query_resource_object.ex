defmodule Klaviyo.OnsiteProfileCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a OnsiteProfileCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.OnsiteProfileCreateQueryResourceObjectAttributes.t(),
          id: String.t() | nil,
          meta: Klaviyo.OnsiteProfileMeta.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :meta, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.OnsiteProfileCreateQueryResourceObjectAttributes, :t},
      id: :string,
      meta: {Klaviyo.OnsiteProfileMeta, :t},
      type: {:const, "profile"}
    ]
  end
end
