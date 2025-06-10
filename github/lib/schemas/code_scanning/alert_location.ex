defmodule GitHub.CodeScanning.AlertLocation do
  @moduledoc """
  Provides struct and type for a CodeScanning.AlertLocation
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          end_column: integer | nil,
          end_line: integer | nil,
          path: String.t() | nil,
          start_column: integer | nil,
          start_line: integer | nil
        }

  defstruct [:__info__, :end_column, :end_line, :path, :start_column, :start_line]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      end_column: :integer,
      end_line: :integer,
      path: {:string, :generic},
      start_column: :integer,
      start_line: :integer
    ]
  end
end
