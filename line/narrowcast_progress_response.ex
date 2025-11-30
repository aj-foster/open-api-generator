defmodule Line.NarrowcastProgressResponse do
  @moduledoc """
  Provides struct and type for a NarrowcastProgressResponse
  """

  @type t :: %__MODULE__{
          acceptedTime: DateTime.t(),
          completedTime: DateTime.t() | nil,
          errorCode: integer | nil,
          failedDescription: String.t() | nil,
          failureCount: integer | nil,
          phase: String.t(),
          successCount: integer | nil,
          targetCount: integer | nil
        }

  defstruct [
    :acceptedTime,
    :completedTime,
    :errorCode,
    :failedDescription,
    :failureCount,
    :phase,
    :successCount,
    :targetCount
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      acceptedTime: {:string, "date-time"},
      completedTime: {:string, "date-time"},
      errorCode: {:integer, "int64"},
      failedDescription: :string,
      failureCount: {:integer, "int64"},
      phase: {:enum, ["waiting", "sending", "succeeded", "failed"]},
      successCount: {:integer, "int64"},
      targetCount: {:integer, "int64"}
    ]
  end
end
