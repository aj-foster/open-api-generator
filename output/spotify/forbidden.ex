defmodule Forbidden do
  @moduledoc """
  Provides struct and type for a Forbidden
  """

  @type json_resp :: %__MODULE__{error: ErrorObject.t()}

  defstruct [:error]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [error: {ErrorObject, :t}]
  end
end
