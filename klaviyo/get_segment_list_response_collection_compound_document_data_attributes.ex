defmodule Klaviyo.GetSegmentListResponseCollectionCompoundDocumentDataAttributes do
  @moduledoc """
  Provides struct and type for a GetSegmentListResponseCollectionCompoundDocumentDataAttributes
  """

  @type t :: %__MODULE__{
          created: DateTime.t() | nil,
          name: String.t() | nil,
          updated: DateTime.t() | nil
        }

  defstruct [:created, :name, :updated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created: {:string, "date-time"}, name: :string, updated: {:string, "date-time"}]
  end
end
