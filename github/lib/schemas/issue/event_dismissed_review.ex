defmodule GitHub.Issue.EventDismissedReview do
  @moduledoc """
  Provides struct and type for a Issue.EventDismissedReview
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          dismissal_commit_id: String.t() | nil,
          dismissal_message: String.t() | nil,
          review_id: integer,
          state: String.t()
        }

  defstruct [:__info__, :dismissal_commit_id, :dismissal_message, :review_id, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dismissal_commit_id: {:union, [{:string, :generic}, :null]},
      dismissal_message: {:union, [{:string, :generic}, :null]},
      review_id: :integer,
      state: {:string, :generic}
    ]
  end
end
