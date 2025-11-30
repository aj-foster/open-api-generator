defmodule Affinda.ResumeDataWorkExperienceOccupationClassification do
  @moduledoc """
  Provides struct and type for a ResumeDataWorkExperienceOccupationClassification
  """

  @type t :: %__MODULE__{
          majorGroup: String.t() | nil,
          majorGroupCode: integer | nil,
          minorGroup: String.t() | nil,
          minorGroupCode: integer | nil,
          socCode: integer | nil,
          subMajorGroup: String.t() | nil,
          subMajorGroupCode: integer | nil,
          title: String.t() | nil
        }

  defstruct [
    :majorGroup,
    :majorGroupCode,
    :minorGroup,
    :minorGroupCode,
    :socCode,
    :subMajorGroup,
    :subMajorGroupCode,
    :title
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      majorGroup: :string,
      majorGroupCode: :integer,
      minorGroup: :string,
      minorGroupCode: :integer,
      socCode: :integer,
      subMajorGroup: :string,
      subMajorGroupCode: :integer,
      title: :string
    ]
  end
end
