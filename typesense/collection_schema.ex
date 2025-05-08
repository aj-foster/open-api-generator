defmodule CollectionSchema do
  @moduledoc """
  Provides struct and type for a CollectionSchema
  """

  @type t :: %__MODULE__{
          default_sorting_field: String.t() | nil,
          enable_nested_fields: boolean | nil,
          fields: [Field.t()],
          name: String.t(),
          symbols_to_index: [String.t()] | nil,
          token_separators: [String.t()] | nil
        }

  defstruct [
    :default_sorting_field,
    :enable_nested_fields,
    :fields,
    :name,
    :symbols_to_index,
    :token_separators
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      default_sorting_field: {:string, :generic},
      enable_nested_fields: :boolean,
      fields: [{Field, :t}],
      name: {:string, :generic},
      symbols_to_index: [string: :generic],
      token_separators: [string: :generic]
    ]
  end
end
