defmodule SimplePublicObjectBatchInput do
  @moduledoc """
  Provides struct and type for a SimplePublicObjectBatchInput
  """

  @type t :: %__MODULE__{
          id: String.t(),
          idProperty: String.t() | nil,
          properties: SimplePublicObjectBatchInputProperties.t()
        }

  defstruct [:id, :idProperty, :properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      idProperty: {:string, :generic},
      properties: {SimplePublicObjectBatchInputProperties, :t}
    ]
  end
end
