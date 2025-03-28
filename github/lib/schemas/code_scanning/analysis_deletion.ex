defmodule GitHub.CodeScanning.AnalysisDeletion do
  @moduledoc """
  Provides struct and type for a CodeScanning.AnalysisDeletion
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          confirm_delete_url: String.t() | nil,
          next_analysis_url: String.t() | nil
        }

  defstruct [:__info__, :confirm_delete_url, :next_analysis_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      confirm_delete_url: {:union, [{:string, :uri}, :null]},
      next_analysis_url: {:union, [{:string, :uri}, :null]}
    ]
  end
end
