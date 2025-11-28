defmodule GetProfileImportJobResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetProfileImportJobResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetProfileImportJobResponseCompoundDocumentData.t(),
          included: [ListResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetProfileImportJobResponseCompoundDocumentData, :t},
      included: [{ListResponseObjectResource, :t}]
    ]
  end
end
