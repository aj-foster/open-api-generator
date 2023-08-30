defmodule OpenAPI.Renderer.Schema do
  @moduledoc """
  Default implementation for callbacks related to rendering schemas

  This module contains the default implementations for:

    * `c:OpenAPI.Renderer.render_schema/2`
    * `c:OpenAPI.Renderer.render_schema_field_function/2`
    * `c:OpenAPI.Renderer.render_schema_struct/2`
    * `c:OpenAPI.Renderer.render_schema_types/2`

  """
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Processor.Schema.Field
  alias OpenAPI.Renderer.File
  alias OpenAPI.Renderer.State
  alias OpenAPI.Renderer.Util

  @doc """
  Render a schema, including typespecs, struct definition, and field function

  Default implementation of `c:OpenAPI.Renderer.render_schema/2`.

  This implementation operates on schemas that appear in multiple contexts. If a schema appears
  in exactly one context as the request or response body of a function, it will instead be
  rendered by an operation callback.

  This function calls the following other callbacks and concatenates their results:

    * `c:OpenAPI.Renderer.render_schema_types/2`
    * `c:OpenAPI.Renderer.render_schema_struct/2`
    * `c:OpenAPI.Renderer.render_schema_field_function/2`

  """
  @spec render(State.t(), File.t()) :: Macro.t()
  def render(state, file) do
    %State{implementation: implementation} = state
    %File{module: module, schemas: schemas} = file

    # TODO: This filter is non-deterministic. It is necessary to store and evaluate all contexts
    # from all instances of the schema.
    non_operation_schemas =
      schemas
      |> Enum.reject(fn
        %Schema{context: {:request, ^module, _op_function_name, _content_type}} -> true
        %Schema{context: {:response, ^module, _op_function_name, _status, _content_type}} -> true
        _else -> false
      end)
      |> Enum.sort_by(& &1.type_name)
      |> Enum.dedup_by(&{&1.module_name, &1.type_name, &1.fields})

    types = implementation.render_schema_types(state, non_operation_schemas)
    struct = implementation.render_schema_struct(state, non_operation_schemas)
    field_function = implementation.render_schema_field_function(state, non_operation_schemas)

    Util.clean_list([types, struct, field_function])
  end

  @doc """
  Render the typespec(s) for all of the given schemas

  Default implementation of `c:OpenAPI.Renderer.render_schema_types/2`.
  """
  @spec render_types(State.t(), [Schema.t()]) :: Macro.t()
  def render_types(state, schemas) do
    for %Schema{fields: fields, type_name: type} <- schemas do
      fields = render_type_fields(state, fields)

      quote do
        @type unquote({type, [], nil}) :: %__MODULE__{
                unquote_splicing(fields)
              }
      end
      |> Util.put_newlines()
    end
  end

  @spec render_type_fields(State.t(), [Field.t()]) :: Macro.t()
  defp render_type_fields(state, fields) do
    for field <- Enum.sort_by(fields, & &1.name) do
      %Field{name: name, nullable: nullable?, required: required?, type: type} = field

      rendered_type =
        if nullable? or not required? do
          Util.to_type(state, {:union, [type, :null]})
        else
          Util.to_type(state, type)
        end

      quote do
        {unquote(String.to_atom(name)), unquote(rendered_type)}
      end
    end
  end

  @doc """
  Render a single struct definition for all of the given schemas

  Default implementation of `c:OpenAPI.Renderer.render_schema_struct/2`.

  This implementation combines the fields of all schemas to create one struct.
  """
  @spec render_struct(State.t(), [Schema.t()]) :: Macro.t()
  def render_struct(state, schemas)
  def render_struct(_state, []), do: []

  def render_struct(_state, schemas) do
    fields =
      Enum.map(schemas, & &1.fields)
      |> List.flatten()
      |> Enum.map(&String.to_atom(&1.name))
      |> Enum.sort()
      |> Enum.dedup()

    quote do
      defstruct unquote(fields)
    end
    |> Util.put_newlines()
  end

  @doc """
  Render a function `__fields__/1` that returns information about schema field types

  Default implementation of `c:OpenAPI.Renderer.render_schema_field_function/2`.

  This implementation renders a function spec and header with one clause for each schema type.
  """
  @spec render_field_function(State.t(), [Schema.t()]) :: Macro.t()
  def render_field_function(state, schemas)
  def render_field_function(_state, []), do: []

  def render_field_function(state, schemas) do
    docstring =
      quote do
        @doc false
      end

    typespec =
      quote do
        @spec __fields__(atom) :: keyword
      end

    header =
      if Enum.any?(schemas, &(&1.type_name == :t)) do
        quote do
          def __fields__(type \\ :t)
        end
      end

    function_clauses =
      schemas
      |> Enum.sort_by(& &1.type_name)
      |> Enum.map(&render_field_function_clause(state, &1))

    Util.clean_list([docstring, typespec, header, function_clauses])
  end

  defp render_field_function_clause(state, schema) do
    %Schema{fields: fields, type_name: type} = schema
    fields = render_field_function_clause_fields(state, fields)

    quote do
      def __fields__(unquote(type)) do
        unquote(fields)
      end
    end
  end

  defp render_field_function_clause_fields(state, fields) do
    fields
    |> Enum.reject(& &1.private)
    |> Enum.sort_by(& &1.name)
    |> Enum.map(fn %Field{name: name, type: type} ->
      quote do
        {unquote(String.to_atom(name)), unquote(Util.to_readable_type(state, type))}
      end
    end)
  end
end
