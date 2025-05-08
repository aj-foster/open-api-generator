defmodule ProfilePartialUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ProfilePartialUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: ProfilePartialUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          meta: ProfileMeta.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :meta, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {ProfilePartialUpdateQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      meta: {ProfileMeta, :t},
      type: {:const, "profile"}
    ]
  end
end
