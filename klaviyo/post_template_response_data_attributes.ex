defmodule PostTemplateResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PostTemplateResponseDataAttributes
  """

  @type t :: %__MODULE__{
          created: DateTime.t() | nil,
          editor_type: String.t(),
          html: String.t(),
          name: String.t(),
          text: String.t() | nil,
          updated: DateTime.t() | nil
        }

  defstruct [:created, :editor_type, :html, :name, :text, :updated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created: {:string, :date_time},
      editor_type: {:string, :generic},
      html: {:string, :generic},
      name: {:string, :generic},
      text: {:string, :generic},
      updated: {:string, :date_time}
    ]
  end
end
