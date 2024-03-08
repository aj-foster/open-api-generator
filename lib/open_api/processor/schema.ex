defmodule OpenAPI.Processor.Schema do
  @moduledoc """
  Processed schema used by the renderer

  This struct is created by the Processor to hold only the data necessary for rendering schemas
  and their types. It has the following fields:

    * `context`: List of contexts where the schema is found in the API description.
    * `fields`: List of `t:OpenAPI.Processor.Schema.Field.t/0` structs contained in the schema.
    * `module_name`: Name of the module where the schema will be defined.
    * `output_format`: Intended format of the output (ex. struct or typespec).
    * `type_name`: Name of the schema's type within its module.

  All of this data is managed by the code generator, and it is unlikely that a callback would
  need to modify this struct directly.
  """
  alias OpenAPI.Spec.Schema, as: SchemaSpec

  @typedoc "Format of rendering the schema (full struct or inline typespec)"
  @type format :: :struct | :type | :none

  @typedoc "Processed schema used by the renderer"
  @type t :: %__MODULE__{
          context: [tuple],
          fields: [],
          module_name: module,
          output_format: format | nil,
          type_name: atom
        }

  defstruct context: [],
            fields: [],
            module_name: nil,
            output_format: nil,

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

  @doc false
  @spec put_output_format(t, format) :: t
  def put_output_format(schema, format) do
    %__MODULE__{schema | output_format: format}
  end
end
