defmodule GitHub.Issue.EventProjectCard do
  @moduledoc """
  Provides struct and type for a Issue.EventProjectCard
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          column_name: String.t(),
          id: integer,
          previous_column_name: String.t() | nil,
          project_id: integer,
          project_url: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :column_name, :id, :previous_column_name, :project_id, :project_url, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      column_name: {:string, :generic},
      id: :integer,
      previous_column_name: {:string, :generic},
      project_id: :integer,
      project_url: {:string, :uri},
      url: {:string, :uri}
    ]
  end
end
