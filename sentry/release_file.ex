defmodule Sentry.ReleaseFile do
  @moduledoc """
  Provides struct and type for a ReleaseFile
  """

  @type t :: %__MODULE__{
          dateCreated: DateTime.t(),
          dist: String.t() | nil,
          headers: Sentry.ReleaseFileHeaders.t(),
          id: String.t(),
          name: String.t(),
          sha1: String.t(),
          size: integer
        }

  defstruct [:dateCreated, :dist, :headers, :id, :name, :sha1, :size]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dateCreated: {:string, "date-time"},
      dist: :string,
      headers: {Sentry.ReleaseFileHeaders, :t},
      id: :string,
      name: :string,
      sha1: :string,
      size: :integer
    ]
  end
end
