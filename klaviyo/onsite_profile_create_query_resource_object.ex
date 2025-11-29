defmodule OnsiteProfileCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a OnsiteProfileCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: OnsiteProfileCreateQueryResourceObjectAttributes.t(),
          id: String.t() | nil,
          meta: OnsiteProfileMeta.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :meta, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {OnsiteProfileCreateQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      meta: {OnsiteProfileMeta, :t},
      type: {:const, "profile"}
    ]
  end
end
