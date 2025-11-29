defmodule PatchFlowResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PatchFlowResponseDataAttributes
  """

  @type t :: %__MODULE__{
          archived: boolean | nil,
          created: DateTime.t() | nil,
          name: String.t() | nil,
          status: String.t() | nil,
          trigger_type: String.t() | nil,
          updated: DateTime.t() | nil
        }

  defstruct [:archived, :created, :name, :status, :trigger_type, :updated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archived: :boolean,
      created: {:string, :date_time},
      name: {:string, :generic},
      status: {:string, :generic},
      trigger_type:
        {:enum,
         ["Added to List", "Date Based", "Low Inventory", "Metric", "Price Drop", "Unconfigured"]},
      updated: {:string, :date_time}
    ]
  end
end
