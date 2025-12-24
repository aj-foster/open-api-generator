defmodule OpenAI.UsageImagesResult do
  @moduledoc """
  Provides struct and type for a UsageImagesResult
  """

  @type t :: %__MODULE__{
          api_key_id: String.t() | nil,
          images: integer,
          model: String.t() | nil,
          num_model_requests: integer,
          object: String.t(),
          project_id: String.t() | nil,
          size: String.t() | nil,
          source: String.t() | nil,
          user_id: String.t() | nil
        }

  defstruct [
    :api_key_id,
    :images,
    :model,
    :num_model_requests,
    :object,
    :project_id,
    :size,
    :source,
    :user_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_key_id: :string,
      images: :integer,
      model: :string,
      num_model_requests: :integer,
      object: {:const, "organization.usage.images.result"},
      project_id: :string,
      size: :string,
      source: :string,
      user_id: :string
    ]
  end
end
