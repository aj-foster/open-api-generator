defmodule OpenAI.UploadFile do
  @moduledoc """
  Provides struct and type for a UploadFile
  """

  @type t :: %__MODULE__{
          bytes: integer | nil,
          created_at: integer | nil,
          expires_at: integer | nil,
          filename: String.t() | nil,
          id: String.t() | nil,
          object: String.t() | nil,
          purpose: String.t() | nil,
          status: String.t() | nil,
          status_details: String.t() | nil
        }

  defstruct [
    :bytes,
    :created_at,
    :expires_at,
    :filename,
    :id,
    :object,
    :purpose,
    :status,
    :status_details
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bytes: :integer,
      created_at: :integer,
      expires_at: :integer,
      filename: :string,
      id: :string,
      object: {:const, "file"},
      purpose:
        {:enum,
         [
           "assistants",
           "assistants_output",
           "batch",
           "batch_output",
           "fine-tune",
           "fine-tune-results",
           "vision"
         ]},
      status: {:enum, ["uploaded", "processed", "error"]},
      status_details: :string
    ]
  end
end
