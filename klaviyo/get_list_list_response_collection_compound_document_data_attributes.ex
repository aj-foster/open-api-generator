defmodule Klaviyo.GetListListResponseCollectionCompoundDocumentDataAttributes do
  @moduledoc """
  Provides struct and type for a GetListListResponseCollectionCompoundDocumentDataAttributes
  """

  @type t :: %__MODULE__{
          created: DateTime.t() | nil,
          name: String.t() | nil,
          opt_in_process: String.t() | nil,
          updated: DateTime.t() | nil
        }

  defstruct [:created, :name, :opt_in_process, :updated]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created: {:string, "date-time"},
      name: :string,
      opt_in_process: {:enum, ["double_opt_in", "single_opt_in"]},
      updated: {:string, "date-time"}
    ]
  end
end
