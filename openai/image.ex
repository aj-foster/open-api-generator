defmodule OpenAI.Image do
  @moduledoc """
  Provides struct and type for a Image
  """

  @type t :: %__MODULE__{
          b64_json: String.t() | nil,
          revised_prompt: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:b64_json, :revised_prompt, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [b64_json: :string, revised_prompt: :string, url: :string]
  end
end
