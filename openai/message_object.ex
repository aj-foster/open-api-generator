defmodule OpenAI.MessageObject do
  @moduledoc """
  Provides struct and type for a MessageObject
  """

  @type t :: %__MODULE__{
          assistant_id: String.t() | nil,
          attachments: [OpenAI.MessageObjectAttachments.t()] | nil,
          completed_at: integer | nil,
          content: [
            OpenAI.MessageContentImageFileObject.t()
            | OpenAI.MessageContentImageUrlObject.t()
            | OpenAI.MessageContentRefusalObject.t()
            | OpenAI.MessageContentTextObject.t()
          ],
          created_at: integer,
          id: String.t(),
          incomplete_at: integer | nil,
          incomplete_details: OpenAI.MessageObjectIncompleteDetails.t() | nil,
          metadata: map | nil,
          object: String.t(),
          role: String.t(),
          run_id: String.t() | nil,
          status: String.t(),
          thread_id: String.t()
        }

  defstruct [
    :assistant_id,
    :attachments,
    :completed_at,
    :content,
    :created_at,
    :id,
    :incomplete_at,
    :incomplete_details,
    :metadata,
    :object,
    :role,
    :run_id,
    :status,
    :thread_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assistant_id: :string,
      attachments: [{OpenAI.MessageObjectAttachments, :t}],
      completed_at: :integer,
      content: [
        union: [
          {OpenAI.MessageContentImageFileObject, :t},
          {OpenAI.MessageContentImageUrlObject, :t},
          {OpenAI.MessageContentRefusalObject, :t},
          {OpenAI.MessageContentTextObject, :t}
        ]
      ],
      created_at: :integer,
      id: :string,
      incomplete_at: :integer,
      incomplete_details: {OpenAI.MessageObjectIncompleteDetails, :t},
      metadata: :map,
      object: {:const, "thread.message"},
      role: {:enum, ["user", "assistant"]},
      run_id: :string,
      status: {:enum, ["in_progress", "incomplete", "completed"]},
      thread_id: :string
    ]
  end
end
