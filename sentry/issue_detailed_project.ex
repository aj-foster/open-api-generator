defmodule Sentry.IssueDetailedProject do
  @moduledoc """
  Provides struct and type for a IssueDetailedProject
  """

  @type t :: %__MODULE__{id: String.t() | nil, name: String.t() | nil, slug: String.t() | nil}

  defstruct [:id, :name, :slug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :string, name: :string, slug: :string]
  end
end
