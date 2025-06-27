defmodule Upload do
  @moduledoc """
  Provides struct and type for a Upload
  """

  @type t :: %__MODULE__{
          bytes: integer,
          created_at: integer,
          expires_at: integer,
          file: UploadFile.t() | nil,
          filename: String.t(),
          id: String.t(),
          object: String.t() | nil,
          purpose: String.t(),
          status: String.t()
        }

  defstruct [:bytes, :created_at, :expires_at, :file, :filename, :id, :object, :purpose, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bytes: :integer,
      created_at: :integer,
      expires_at: :integer,
      file: {UploadFile, :t},
      filename: {:string, :generic},
      id: {:string, :generic},
      object: {:const, "upload"},
      purpose: {:string, :generic},
      status: {:enum, ["pending", "completed", "cancelled", "expired"]}
    ]
  end
end
