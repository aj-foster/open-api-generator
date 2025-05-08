defmodule InvitationResponse do
  @moduledoc """
  Provides struct and type for a InvitationResponse
  """

  @type t :: %__MODULE__{status: String.t() | nil}

  defstruct [:status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [status: {:enum, ["accepted", "declined"]}]
  end
end
