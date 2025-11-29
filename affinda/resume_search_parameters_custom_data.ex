defmodule ResumeSearchParametersCustomData do
  @moduledoc """
  Provides struct and type for a ResumeSearchParametersCustomData
  """

  @type t :: %__MODULE__{
          dataPoint: String.t() | nil,
          filterType: String.t() | nil,
          query: map | nil,
          required: boolean | nil,
          weight: number | nil
        }

  defstruct [:dataPoint, :filterType, :query, :required, :weight]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dataPoint: {:string, :generic},
      filterType: {:enum, ["equals", "range"]},
      query: :map,
      required: :boolean,
      weight: :number
    ]
  end
end
