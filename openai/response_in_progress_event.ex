defmodule ResponseInProgressEvent do
  @moduledoc """
  Provides struct and type for a ResponseInProgressEvent
  """

  @type t :: %__MODULE__{response: Response.t(), type: String.t()}

  defstruct [:response, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [response: {Response, :t}, type: {:const, "response.in_progress"}]
  end
end
