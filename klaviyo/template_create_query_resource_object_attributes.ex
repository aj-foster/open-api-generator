defmodule TemplateCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a TemplateCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          editor_type: String.t(),
          html: String.t() | nil,
          name: String.t(),
          text: String.t() | nil
        }

  defstruct [:editor_type, :html, :name, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      editor_type: {:string, :generic},
      html: {:string, :generic},
      name: {:string, :generic},
      text: {:string, :generic}
    ]
  end
end
