defmodule GitHub.CodeScanning.AlertRule do
  @moduledoc """
  Provides struct and type for a CodeScanning.AlertRule
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          description: String.t() | nil,
          full_description: String.t() | nil,
          help: String.t() | nil,
          help_uri: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          security_severity_level: String.t() | nil,
          severity: String.t() | nil,
          tags: [String.t()] | nil
        }

  defstruct [
    :__info__,
    :description,
    :full_description,
    :help,
    :help_uri,
    :id,
    :name,
    :security_severity_level,
    :severity,
    :tags
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      full_description: {:string, :generic},
      help: {:union, [{:string, :generic}, :null]},
      help_uri: {:union, [{:string, :generic}, :null]},
      id: {:union, [{:string, :generic}, :null]},
      name: {:string, :generic},
      security_severity_level: {:enum, ["low", "medium", "high", "critical", nil]},
      severity: {:enum, ["none", "note", "warning", "error", nil]},
      tags: {:union, [[string: :generic], :null]}
    ]
  end
end
