defmodule MetricResponseObjectResourceAttributes do
  @moduledoc """
  Provides struct and type for a MetricResponseObjectResourceAttributes
  """

  @type t :: %__MODULE__{
          created: String.t() | nil,
          integration: map | nil,
          name: String.t() | nil,
          updated: String.t() | nil
        }

  defstruct [:created, :integration, :name, :updated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created: {:string, :generic},
      integration: :map,
      name: {:string, :generic},
      updated: {:string, :generic}
    ]
  end
end
