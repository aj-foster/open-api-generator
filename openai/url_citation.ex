defmodule OpenAI.UrlCitation do
  @moduledoc """
  Provides struct and type for a UrlCitation
  """

  @type t :: %__MODULE__{
          end_index: integer,
          start_index: integer,
          title: String.t(),
          type: String.t(),
          url: String.t()
        }

  defstruct [:end_index, :start_index, :title, :type, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      end_index: :integer,
      start_index: :integer,
      title: :string,
      type: {:const, "url_citation"},
      url: :string
    ]
  end
end
