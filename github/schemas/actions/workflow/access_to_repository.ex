defmodule GitHub.Actions.Workflow.AccessToRepository do
  @moduledoc """
  Provides struct and type for a Actions.Workflow.AccessToRepository
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, access_level: String.t()}

  defstruct [:__info__, :access_level]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [access_level: {:enum, ["none", "user", "organization"]}]
  end
end
