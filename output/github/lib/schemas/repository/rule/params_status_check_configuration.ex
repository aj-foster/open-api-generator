defmodule GitHub.Repository.Rule.ParamsStatusCheckConfiguration do
  @moduledoc """
  Provides struct and type for a Repository.Rule.ParamsStatusCheckConfiguration
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, context: String.t(), integration_id: integer | nil}

  defstruct [:__info__, :context, :integration_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [context: {:string, :generic}, integration_id: :integer]
  end
end
