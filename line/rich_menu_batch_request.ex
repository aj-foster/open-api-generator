defmodule Line.RichMenuBatchRequest do
  @moduledoc """
  Provides struct and type for a RichMenuBatchRequest
  """

  @type t :: %__MODULE__{
          operations: [Line.RichMenuBatchOperation.t()],
          resumeRequestKey: String.t() | nil
        }

  defstruct [:operations, :resumeRequestKey]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [operations: [{Line.RichMenuBatchOperation, :t}], resumeRequestKey: :string]
  end
end
