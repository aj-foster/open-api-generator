defmodule OutputText do
  @moduledoc """
  Provides struct and type for a OutputText
  """

  @type t :: %__MODULE__{
          annotations: [FileCitation.t() | FilePath.t() | UrlCitation.t()],
          text: String.t(),
          type: String.t()
        }

  defstruct [:annotations, :text, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotations: [union: [{FileCitation, :t}, {FilePath, :t}, {UrlCitation, :t}]],
      text: {:string, :generic},
      type: {:const, "output_text"}
    ]
  end
end
