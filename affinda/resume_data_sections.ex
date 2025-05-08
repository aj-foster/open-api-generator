defmodule ResumeDataSections do
  @moduledoc """
  Provides struct and type for a ResumeDataSections
  """

  @type t :: %__MODULE__{
          bbox: [number] | nil,
          pageIndex: integer | nil,
          sectionType: String.t() | nil,
          text: String.t() | nil
        }

  defstruct [:bbox, :pageIndex, :sectionType, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bbox: [:number],
      pageIndex: :integer,
      sectionType: {:string, :generic},
      text: {:string, :generic}
    ]
  end
end
