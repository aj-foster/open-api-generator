defmodule OpenAI.UploadPart do
  @moduledoc """
  Provides struct and type for a UploadPart
  """

  @type t :: %__MODULE__{
          created_at: integer,
          id: String.t(),
          object: String.t(),
          upload_id: String.t()
        }

  defstruct [:created_at, :id, :object, :upload_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created_at: :integer, id: :string, object: {:const, "upload.part"}, upload_id: :string]
  end
end
