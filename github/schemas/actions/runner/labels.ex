defmodule GitHub.Actions.Runner.Labels do
  @moduledoc """
  Provides struct and type for a Actions.Runner.Labels
  """
  use GitHub.Encoder

  @type json_resp :: %__MODULE__{
          __info__: map,
          labels: [GitHub.Actions.Runner.Label.t()],
          total_count: integer
        }

  defstruct [:__info__, :labels, :total_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [labels: [{GitHub.Actions.Runner.Label, :t}], total_count: :integer]
  end
end
