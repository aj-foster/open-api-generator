defmodule ClientErrorErrorsSource do
  @moduledoc """
  Provides struct and type for a ClientErrorErrorsSource
  """

  @type json_resp :: %__MODULE__{parameter: String.t() | nil, pointer: String.t() | nil}

  defstruct [:parameter, :pointer]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [parameter: {:string, :generic}, pointer: {:string, :generic}]
  end
end
