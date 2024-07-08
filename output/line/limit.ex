defmodule Limit do
  @moduledoc """
  Provides struct and type for a Limit
  """

  @type t :: %__MODULE__{max: integer | nil, upToRemainingQuota: boolean | nil}

  defstruct [:max, :upToRemainingQuota]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [max: :integer, upToRemainingQuota: :boolean]
  end
end
