defmodule GitHub.OrgCustomProperty do
  @moduledoc """
  Provides struct and type for a OrgCustomProperty
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          allowed_values: [String.t()] | nil,
          default_value: String.t() | [String.t()] | nil,
          description: String.t() | nil,
          property_name: String.t(),
          required: boolean | nil,
          value_type: String.t(),
          values_editable_by: String.t() | nil
        }

  defstruct [
    :__info__,
    :allowed_values,
    :default_value,
    :description,
    :property_name,
    :required,
    :value_type,
    :values_editable_by
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allowed_values: {:union, [[string: :generic], :null]},
      default_value: {:union, [{:string, :generic}, [string: :generic]]},
      description: {:union, [{:string, :generic}, :null]},
      property_name: {:string, :generic},
      required: :boolean,
      value_type: {:enum, ["string", "single_select"]},
      values_editable_by: {:enum, ["org_actors", "org_and_repo_actors", nil]}
    ]
  end
end
