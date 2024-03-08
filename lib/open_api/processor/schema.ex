defmodule OpenAPI.Processor.Schema do
  @moduledoc """
  Processed schema used by the renderer

  This struct is created by the Processor to hold only the data necessary for rendering schemas
  and their types. It has the following fields:

    * `context`: List of contexts where the schema is found in the API description.
    * `fields`: List of `t:OpenAPI.Processor.Schema.Field.t/0` structs contained in the schema.
    * `module_name`: Name of the module where the schema will be defined.
    * `output_format`: Intended format of the output (ex. struct or typespec).
    * `ref`: Reference of the schema and its original spec in the processor state.
    * `type_name`: Name of the schema's type within its module.

  All of this data is managed by the code generator, and it is unlikely that a callback would
  need to modify this struct directly.
  """
  alias OpenAPI.Processor.Schema.Field
  alias OpenAPI.Processor.Type
  alias OpenAPI.Spec.Schema, as: SchemaSpec

  @typedoc "Format of rendering the schema (full struct or inline typespec)"
  @type format :: :struct | :type | :none

  @typedoc "Processed schema used by the renderer"
  @type t :: %__MODULE__{
          context: [tuple],
          fields: [Field.t()],
          module_name: module,
          output_format: format | nil,
          ref: reference,
          type_name: atom
        }

  defstruct context: [],
            fields: [],
            module_name: nil,
            output_format: nil,
            ref: nil,
            type_name: nil

  #
  # Creation
  #

  @doc false
  @spec map(reference) :: t
  def map(ref) do
    %__MODULE__{
      fields: [],
      module_name: nil,
      output_format: :none,
      ref: ref,
      type_name: :map
    }
  end

  @doc false
  @spec new(reference, SchemaSpec.t(), [Field.t()]) :: t
  def new(ref, schema_spec, fields) do
    %SchemaSpec{"$oag_schema_context": context} = schema_spec

    %__MODULE__{
      context: context,
      fields: fields,
      module_name: nil,
      output_format: nil,
      ref: ref,
      type_name: nil
    }
  end

  #
  # Modification
  #

  @doc false
  @spec add_context(t, tuple) :: t
  def add_context(%__MODULE__{context: contexts} = schema, new_context) do
    contexts = Enum.uniq([new_context | contexts])
    %__MODULE__{schema | context: contexts}
  end

  @doc false
  @spec merge(t, t) :: t
  def merge(schema_a, schema_b) do
    fields_a = Map.new(schema_a.fields, fn field -> {field.name, field} end)
    fields_b = Map.new(schema_b.fields, fn field -> {field.name, field} end)

    fields =
      Map.merge(fields_a, fields_b, fn name, field_a, field_b ->
        %Field{
          name: name,
          nullable: field_a.nullable or field_b.nullable,
          private: field_a.private and field_b.private,
          required: field_a.required and field_b.required,
          type: Type.merge(field_a.type, field_b.type)
        }
      end)
      |> Map.values()

    %__MODULE__{
      context: Enum.uniq(schema_a.context ++ schema_b.context),
      fields: fields,
      module_name: schema_a.module_name,
      output_format: schema_a.output_format,
      ref: schema_a.ref,
      type_name: schema_a.type_name
    }
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
