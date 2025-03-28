defmodule AuditLogEntryResponse do
  @moduledoc """
  Provides struct and type for a AuditLogEntryResponse
  """

  @type t :: %__MODULE__{
          action_type: integer,
          changes: [map] | nil,
          id: String.t(),
          options: AuditLogEntryResponseOptions.t() | nil,
          reason: String.t() | nil,
          target_id: String.t() | nil,
          user_id: String.t() | nil
        }

  defstruct [:action_type, :changes, :id, :options, :reason, :target_id, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action_type: :integer,
      changes: {:union, [[:map], :null]},
      id: {:string, :generic},
      options: {:union, [{AuditLogEntryResponseOptions, :t}, :null]},
      reason: {:union, [{:string, :generic}, :null]},
      target_id: {:union, [{:string, :generic}, :null]},
      user_id: {:union, [{:string, :generic}, :null]}
    ]
  end
end
