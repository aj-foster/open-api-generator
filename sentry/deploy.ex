defmodule Deploy do
  @moduledoc """
  Provides struct and type for a Deploy
  """

  @type t :: %__MODULE__{
          dateFinished: DateTime.t(),
          dateStarted: DateTime.t() | nil,
          environment: String.t(),
          id: String.t(),
          name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:dateFinished, :dateStarted, :environment, :id, :name, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dateFinished: {:string, :date_time},
      dateStarted: {:string, :date_time},
      environment: {:string, :generic},
      id: {:string, :generic},
      name: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
