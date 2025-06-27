defmodule GitHub.Reaction.Rollup do
  @moduledoc """
  Provides struct and type for a Reaction.Rollup
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          "+1": integer,
          "-1": integer,
          __info__: map,
          confused: integer,
          eyes: integer,
          heart: integer,
          hooray: integer,
          laugh: integer,
          rocket: integer,
          total_count: integer,
          url: String.t()
        }

  defstruct [
    :"+1",
    :"-1",
    :__info__,
    :confused,
    :eyes,
    :heart,
    :hooray,
    :laugh,
    :rocket,
    :total_count,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "+1": :integer,
      "-1": :integer,
      confused: :integer,
      eyes: :integer,
      heart: :integer,
      hooray: :integer,
      laugh: :integer,
      rocket: :integer,
      total_count: :integer,
      url: {:string, :uri}
    ]
  end
end
