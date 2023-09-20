defmodule OpenAPI.Processor.Schema do
  @moduledoc """
  Processed schema used by the renderer

  This struct is created by the Processor to hold only the data necessary for rendering schemas
  and their types. It has the following fields:

    * `context`: List of contexts where the schema is found in the API description.
    * `fields`: List of `t:OpenAPI.Processor.Schema.Field.t/0` structs contained in the schema.
    * `module_name`: Name of the module where the schema will be defined.
    * `type_name`: Name of the schema's type within its module.

  All of this data is managed by the code generator, and it is unlikely that a callback would
  need to modify this struct directly.
  """
  alias OpenAPI.Spec.Schema, as: SchemaSpec

  @typedoc "Processed schema used by the renderer"
  @type t :: %__MODULE__{
          context: [tuple],
          fields: [],
          module_name: module,
          type_name: atom
        }

  defstruct context: [],
            fields: [],
            module_name: nil,
            type_name: :t

  @doc false
  @spec add_context(t, tuple) :: t
  def add_context(%__MODULE__{context: contexts} = schema, new_context) do
    contexts = Enum.uniq([new_context | contexts])
    %__MODULE__{schema | context: contexts}
  end

  @doc false
  @spec merge_contexts(t, SchemaSpec.t()) :: t
  def merge_contexts(
        %__MODULE__{context: contexts} = schema,
        %SchemaSpec{"$oag_schema_context": new_contexts}
      ) do
    contexts = Enum.uniq(new_contexts ++ contexts)
    %__MODULE__{schema | context: contexts}
  end
end
