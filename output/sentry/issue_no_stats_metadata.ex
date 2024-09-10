defmodule IssueNoStatsMetadata do
  @moduledoc """
  Provides struct and types for a IssueNoStatsMetadata
  """

  @type t :: %__MODULE__{
          filename: String.t(),
          title: String.t(),
          type: String.t(),
          value: String.t()
        }

  defstruct [:filename, :title, :type, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      filename: {:string, :generic},
      title: {:string, :generic},
      type: {:string, :generic},
      value: {:string, :generic}
    ]
  end
end
