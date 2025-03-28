defmodule GitHub.PackageVersion do
  @moduledoc """
  Provides struct and type for a PackageVersion
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          deleted_at: DateTime.t() | nil,
          description: String.t() | nil,
          html_url: String.t() | nil,
          id: integer,
          license: String.t() | nil,
          metadata: GitHub.PackageVersionMetadata.t() | nil,
          name: String.t(),
          package_html_url: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :created_at,
    :deleted_at,
    :description,
    :html_url,
    :id,
    :license,
    :metadata,
    :name,
    :package_html_url,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      deleted_at: {:string, :date_time},
      description: {:string, :generic},
      html_url: {:string, :generic},
      id: :integer,
      license: {:string, :generic},
      metadata: {GitHub.PackageVersionMetadata, :t},
      name: {:string, :generic},
      package_html_url: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :generic}
    ]
  end
end
