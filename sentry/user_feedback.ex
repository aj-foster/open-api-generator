defmodule Sentry.UserFeedback do
  @moduledoc """
  Provides struct and type for a UserFeedback
  """

  @type t :: %__MODULE__{
          comments: String.t(),
          dateCreated: String.t(),
          email: String.t(),
          event: Sentry.UserFeedbackEvent.t(),
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
      comments: :string,
      dateCreated: :string,
      email: :string,
      event: {Sentry.UserFeedbackEvent, :t},
      eventID: :string,
      id: :string,
      issue: :map,
      name: :string,
      user: :map
    ]
  end
end
