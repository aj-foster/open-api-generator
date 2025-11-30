defmodule Klaviyo.PostProfileMergeResponseData do
  @moduledoc """
  Provides struct and type for a PostProfileMergeResponseData
  """

  @type t :: %__MODULE__{id: String.t(), links: Klaviyo.ObjectLinks.t(), type: String.t()}

  defstruct [:id, :links, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :string, links: {Klaviyo.ObjectLinks, :t}, type: {:const, "profile"}]
  end
end
