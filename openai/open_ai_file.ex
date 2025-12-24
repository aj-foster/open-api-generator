defmodule OpenAI.OpenAIFile do
  @moduledoc """
  Provides struct and type for a OpenAIFile
  """

  @type t :: %__MODULE__{
          bytes: integer,
          created_at: integer,
          expires_at: integer | nil,
          filename: String.t(),
          id: String.t(),
          object: String.t(),
          purpose: String.t(),
          status: String.t(),
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
