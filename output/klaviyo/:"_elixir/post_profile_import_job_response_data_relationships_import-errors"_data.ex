defmodule :"Elixir.:\"Elixir.PostProfileImportJobResponseDataRelationshipsImport-errors\"Data" do
  @moduledoc """
  Provides struct and type for a :"Elixir.:\"Elixir.PostProfileImportJobResponseDataRelationshipsImport-errors\"Data"
  """

  @type t :: %__MODULE__{id: String.t(), type: String.t()}

  defstruct [:id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, type: {:const, "import-error"}]
  end
end
