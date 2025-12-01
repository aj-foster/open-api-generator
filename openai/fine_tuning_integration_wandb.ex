defmodule OpenAI.FineTuningIntegrationWandb do
  @moduledoc """
  Provides struct and type for a FineTuningIntegrationWandb
  """

  @type t :: %__MODULE__{
          entity: String.t() | nil,
          name: String.t() | nil,
          project: String.t(),
          tags: [String.t()] | nil
        }

  defstruct [:entity, :name, :project, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [entity: :string, name: :string, project: :string, tags: [:string]]
  end
end
