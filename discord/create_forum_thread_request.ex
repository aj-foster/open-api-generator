defmodule CreateForumThreadRequest do
  @moduledoc """
  Provides struct and type for a CreateForumThreadRequest
  """

  @type t :: %__MODULE__{
          applied_tags: [String.t()] | nil,
          auto_archive_duration: integer | nil,
          message: BaseCreateMessageCreateRequest.t(),
          name: String.t(),
          rate_limit_per_user: integer | nil
        }

  defstruct [:applied_tags, :auto_archive_duration, :message, :name, :rate_limit_per_user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      applied_tags: {:union, [[string: :generic], :null]},
      auto_archive_duration: {:union, [:integer, :null]},
      message: {BaseCreateMessageCreateRequest, :t},
      name: {:string, :generic},
      rate_limit_per_user: {:union, [:integer, :null]}
    ]
  end
end
