defmodule GitHub.CodeScanning.DefaultSetupUpdateResponse do
  @moduledoc """
  Provides struct and type for a CodeScanning.DefaultSetupUpdateResponse
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, run_id: integer | nil, run_url: String.t() | nil}

  defstruct [:__info__, :run_id, :run_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [run_id: :integer, run_url: {:string, :generic}]
  end
end
