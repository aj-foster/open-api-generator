defmodule CostsResult do
  @moduledoc """
  Provides struct and type for a CostsResult
  """

  @type t :: %__MODULE__{
          amount: CostsResultAmount.t() | nil,
          line_item: String.t() | nil,
          object: String.t(),
          project_id: String.t() | nil
        }

  defstruct [:amount, :line_item, :object, :project_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: {CostsResultAmount, :t},
      line_item: {:string, :generic},
      object: {:const, "organization.costs.result"},
      project_id: {:string, :generic}
    ]
  end
end
