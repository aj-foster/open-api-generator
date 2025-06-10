defmodule InputMessageResource do
  @moduledoc """
  Provides struct and type for a InputMessageResource
  """

  @type t :: %__MODULE__{
          content: [InputFile.t() | InputImage.t() | InputText.t()] | nil,
          id: String.t() | nil,
          role: String.t() | nil,
          status: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:content, :id, :role, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: [union: [{InputFile, :t}, {InputImage, :t}, {InputText, :t}]],
      id: {:string, :generic},
      role: {:enum, ["user", "system", "developer"]},
      status: {:enum, ["in_progress", "completed", "incomplete"]},
      type: {:const, "message"}
    ]
  end
end
