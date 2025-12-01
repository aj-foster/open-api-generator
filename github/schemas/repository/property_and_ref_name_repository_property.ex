defmodule GitHub.Repository.PropertyAndRefNameRepositoryProperty do
  @moduledoc """
  Provides struct and type for a Repository.PropertyAndRefNameRepositoryProperty
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          exclude: [GitHub.Repository.Ruleset.ConditionsRepositoryPropertySpec.t()] | nil,
          include: [GitHub.Repository.Ruleset.ConditionsRepositoryPropertySpec.t()] | nil
        }

  defstruct [:__info__, :exclude, :include]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      exclude: [{GitHub.Repository.Ruleset.ConditionsRepositoryPropertySpec, :t}],
      include: [{GitHub.Repository.Ruleset.ConditionsRepositoryPropertySpec, :t}]
    ]
  end
end
