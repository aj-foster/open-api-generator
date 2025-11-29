defmodule CreateModerationRequest do
  @moduledoc """
  Provides struct and type for a CreateModerationRequest
  """

  @type t :: %__MODULE__{input: String.t() | [map] | [String.t()], model: String.t() | nil}

  defstruct [:input, :model]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: {:union, [{:string, :generic}, [:map], [string: :generic]]},
      model:
        {:union,
         enum: [
           "omni-moderation-latest",
           "omni-moderation-2024-09-26",
           "text-moderation-latest",
           "text-moderation-stable"
         ],
         string: :generic}
    ]
  end
end
