defmodule BreadcrumbsDataValues do
  @moduledoc """
  Provides struct and type for a BreadcrumbsDataValues
  """

  @type t :: %__MODULE__{
          category: String.t(),
          data: map | nil,
          event_id: String.t() | nil,
          level: String.t(),
          message: String.t() | nil,
          timestamp: DateTime.t(),
          type: String.t()
        }

  defstruct [:category, :data, :event_id, :level, :message, :timestamp, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      category: {:string, :generic},
      data: :map,
      event_id: {:string, :generic},
      level: {:string, :generic},
      message: {:string, :generic},
      timestamp: {:string, :date_time},
      type: {:string, :generic}
    ]
  end
end
