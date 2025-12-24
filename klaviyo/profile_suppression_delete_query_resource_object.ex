defmodule Klaviyo.ProfileSuppressionDeleteQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ProfileSuppressionDeleteQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.ProfileSuppressionDeleteQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.ProfileSuppressionDeleteQueryResourceObjectAttributes, :t},
      type: {:const, "profile"}
    ]
  end
end
