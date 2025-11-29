defmodule UserFeedback do
  @moduledoc """
  Provides struct and type for a UserFeedback
  """

  @type t :: %__MODULE__{
          comments: String.t(),
          dateCreated: String.t(),
          email: String.t(),
          event: UserFeedbackEvent.t(),
          eventID: String.t(),
          id: String.t(),
          issue: map | nil,
          name: String.t(),
          user: map | nil
        }

  defstruct [:comments, :dateCreated, :email, :event, :eventID, :id, :issue, :name, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      comments: {:string, :generic},
      dateCreated: {:string, :generic},
      email: {:string, :generic},
      event: {UserFeedbackEvent, :t},
      eventID: {:string, :generic},
      id: {:string, :generic},
      issue: :map,
      name: {:string, :generic},
      user: :map
    ]
  end
end
