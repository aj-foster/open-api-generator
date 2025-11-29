defmodule GetSegmentRetrieveResponseCompoundDocumentDataAttributes do
  @moduledoc """
  Provides struct and type for a GetSegmentRetrieveResponseCompoundDocumentDataAttributes
  """

  @type t :: %__MODULE__{profile_count: integer | nil}

  defstruct [:profile_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [profile_count: :integer]
  end
end
