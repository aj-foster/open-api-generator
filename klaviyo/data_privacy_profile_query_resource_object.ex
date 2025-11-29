defmodule DataPrivacyProfileQueryResourceObject do
  @moduledoc """
  Provides struct and type for a DataPrivacyProfileQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: DataPrivacyProfileQueryResourceObjectAttributes.t(),
          id: String.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {DataPrivacyProfileQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "profile"}
    ]
  end
end
