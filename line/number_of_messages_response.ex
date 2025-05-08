defmodule NumberOfMessagesResponse do
  @moduledoc """
  Provides struct and type for a NumberOfMessagesResponse
  """

  @type t :: %__MODULE__{status: String.t(), success: integer | nil}

  defstruct [:status, :success]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      status: {:enum, ["ready", "unready", "unavailable_for_privacy", "out_of_service"]},
      success: :integer
    ]
  end
end
