defmodule PatchSegmentPartialUpdateResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PatchSegmentPartialUpdateResponseDataAttributes
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
    [created: {:string, :date_time}, name: {:string, :generic}, updated: {:string, :date_time}]
  end
end
