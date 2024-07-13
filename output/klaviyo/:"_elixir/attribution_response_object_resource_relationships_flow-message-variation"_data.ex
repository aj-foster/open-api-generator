defmodule :"Elixir.:\"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message-variation\"Data" do
  @moduledoc """
  Provides struct and type for a :"Elixir.:\"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message-variation\"Data"
  """

  @type t :: %__MODULE__{id: String.t(), type: String.t()}

  defstruct [:id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, type: {:const, "flow-message"}]
  end
end
