defmodule IssueDetailedActivity do
  @moduledoc """
  Provides struct and type for a IssueDetailedActivity
  """

  @type t :: %__MODULE__{
          data: map | nil,
          dateCreated: String.t() | nil,
          id: String.t() | nil,
          type: String.t() | nil,
          user: map | nil
        }

  defstruct [:data, :dateCreated, :id, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: :map,
      dateCreated: {:string, :generic},
      id: {:string, :generic},
      type: {:string, :generic},
      user: :map
    ]
  end
end
