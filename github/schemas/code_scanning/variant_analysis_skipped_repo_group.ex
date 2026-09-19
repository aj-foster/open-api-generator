defmodule GitHub.CodeScanning.VariantAnalysisSkippedRepoGroup do
  @moduledoc """
  Provides struct and type for a CodeScanning.VariantAnalysisSkippedRepoGroup
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          repositories: [GitHub.CodeScanning.VariantAnalysisRepository.t()],
          repository_count: integer
        }

  defstruct [:__info__, :repositories, :repository_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      repositories: [{GitHub.CodeScanning.VariantAnalysisRepository, :t}],
      repository_count: :integer
    ]
  end
end
