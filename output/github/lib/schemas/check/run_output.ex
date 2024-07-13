defmodule GitHub.Check.RunOutput do
  @moduledoc """
  Provides struct and type for a Check.RunOutput
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          annotations_count: integer,
          annotations_url: String.t(),
          summary: String.t() | nil,
          text: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [:__info__, :annotations_count, :annotations_url, :summary, :text, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotations_count: :integer,
      annotations_url: {:string, :uri},
      summary: {:union, [{:string, :generic}, :null]},
      text: {:union, [{:string, :generic}, :null]},
      title: {:union, [{:string, :generic}, :null]}
    ]
  end
end
