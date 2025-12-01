defmodule GitHub.CommunityProfileFiles do
  @moduledoc """
  Provides struct and type for a CommunityProfileFiles
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          code_of_conduct: GitHub.CodeOfConduct.simple() | nil,
          code_of_conduct_file: GitHub.CommunityHealthFile.t() | nil,
          contributing: GitHub.CommunityHealthFile.t() | nil,
          issue_template: GitHub.CommunityHealthFile.t() | nil,
          license: GitHub.License.simple() | nil,
          pull_request_template: GitHub.CommunityHealthFile.t() | nil,
          readme: GitHub.CommunityHealthFile.t() | nil
        }

  defstruct [
    :__info__,
    :code_of_conduct,
    :code_of_conduct_file,
    :contributing,
    :issue_template,
    :license,
    :pull_request_template,
    :readme
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_of_conduct: {:union, [{GitHub.CodeOfConduct, :simple}, :null]},
      code_of_conduct_file: {:union, [{GitHub.CommunityHealthFile, :t}, :null]},
      contributing: {:union, [{GitHub.CommunityHealthFile, :t}, :null]},
      issue_template: {:union, [{GitHub.CommunityHealthFile, :t}, :null]},
      license: {:union, [{GitHub.License, :simple}, :null]},
      pull_request_template: {:union, [{GitHub.CommunityHealthFile, :t}, :null]},
      readme: {:union, [{GitHub.CommunityHealthFile, :t}, :null]}
    ]
  end
end
