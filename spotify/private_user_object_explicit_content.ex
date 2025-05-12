defmodule PrivateUserObjectExplicitContent do
  @moduledoc """
  Provides struct and type for a PrivateUserObjectExplicitContent
  """

  @type t :: %__MODULE__{filter_enabled: boolean | nil, filter_locked: boolean | nil}

  defstruct [:filter_enabled, :filter_locked]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [filter_enabled: :boolean, filter_locked: :boolean]
  end
end
