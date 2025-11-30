defmodule OpenAI.ComputerTool do
  @moduledoc """
  Provides struct and type for a ComputerTool
  """

  @type t :: %__MODULE__{
          display_height: number,
          display_width: number,
          environment: String.t(),
          type: String.t()
        }

  defstruct [:display_height, :display_width, :environment, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      display_height: :number,
      display_width: :number,
      environment: {:enum, ["mac", "windows", "ubuntu", "browser"]},
      type: {:const, "computer-preview"}
    ]
  end
end
