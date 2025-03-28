defmodule ProfileUpsertQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ProfileUpsertQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: ProfileUpsertQueryResourceObjectAttributes.t(),
          id: String.t() | nil,
          meta: ProfileMeta.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :meta, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {ProfileUpsertQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      meta: {ProfileMeta, :t},
      type: {:const, "profile"}
    ]
  end
end
