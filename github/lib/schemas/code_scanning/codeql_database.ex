defmodule GitHub.CodeScanning.CodeqlDatabase do
  @moduledoc """
  Provides struct and type for a CodeScanning.CodeqlDatabase
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          commit_oid: String.t() | nil,
          content_type: String.t(),
          created_at: DateTime.t(),
          id: integer,
          language: String.t(),
          name: String.t(),
          size: integer,
          updated_at: DateTime.t(),
          uploader: GitHub.User.simple(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :commit_oid,
    :content_type,
    :created_at,
    :id,
    :language,
    :name,
    :size,
    :updated_at,
    :uploader,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      commit_oid: {:union, [{:string, :generic}, :null]},
      content_type: {:string, :generic},
      created_at: {:string, :date_time},
      id: :integer,
      language: {:string, :generic},
      name: {:string, :generic},
      size: :integer,
      updated_at: {:string, :date_time},
      uploader: {GitHub.User, :simple},
      url: {:string, :uri}
    ]
  end
end
