defmodule UserFeedbackEvent do
  @moduledoc """
  Provides struct and type for a UserFeedbackEvent
  """

  @type t :: %__MODULE__{eventID: String.t() | nil, id: String.t() | nil}

  defstruct [:eventID, :id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [eventID: {:string, :generic}, id: {:string, :generic}]
  end
end
