defmodule SearchParametersCustomData do
  @moduledoc """
  Provides struct and type for a SearchParametersCustomData
  """

  @type t :: %__MODULE__{
          dataPoint: String.t(),
          filterType: String.t(),
          query: map,
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
