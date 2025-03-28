defmodule CreateGroupDMInviteRequest do
  @moduledoc """
  Provides struct and type for a CreateGroupDMInviteRequest
  """

  @type t :: %__MODULE__{max_age: integer | nil}

  defstruct [:max_age]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [max_age: {:union, [:integer, :null]}]
  end
end
