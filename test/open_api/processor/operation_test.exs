defmodule OpenAPI.Processor.OperationTest do
  use ExUnit.Case, async: true

  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Operation.Param
  alias OpenAPI.Spec.ExternalDocumentation
  alias OpenAPI.Spec.Path.Operation, as: OpSpec
  alias OpenAPI.Spec.RequestBody
  alias OpenAPI.Spec.Schema, as: SchemaSpec

  describe "docstring/3" do
    test "creates a docstring with minimal information" do
      operation = %OpSpec{
        "$oag_path": "/",
        "$oag_path_method": "GET",
        description: nil,
        external_docs: nil,
        summary: nil
      }

      assert Operation.docstring(nil, operation, []) ==
               """
               GET `/`
               """
    end

    test "creates a docstring with summary and description" do
      operation = %OpSpec{
        "$oag_path": "/",
        "$oag_path_method": "GET",
        description: "What more could I say?",
        external_docs: nil,
        summary: "Does stuff"
      }

      assert Operation.docstring(nil, operation, []) ==
               """
               Does stuff

               What more could I say?
               """
    end

    test "creates a docstring with summary and external docs" do
      operation = %OpSpec{
        "$oag_path": "/",
        "$oag_path_method": "GET",
        description: nil,
        external_docs: %ExternalDocumentation{url: "https://google.com/"},
        summary: "Does stuff"
      }

      assert Operation.docstring(nil, operation, []) ==
               """
               Does stuff

               ## Resources

                 * [Documentation](https://google.com/)

               """
    end

    test "creates a docstring with summary and query params" do
      operation = %OpSpec{
        "$oag_path": "/",
        "$oag_path_method": "GET",
        description: nil,
        external_docs: nil,
        summary: "Does stuff"
      }

      query_params = [
        %Param{description: "Something", name: "one", value_type: :string},
        %Param{description: "Something else", name: "two", value_type: :string}
      ]

      assert Operation.docstring(nil, operation, query_params) ==
               """
               Does stuff

               ## Options

                 * `one`: Something
                 * `two`: Something else

               """
    end

    test "creates a docstring with everything" do
      operation = %OpSpec{
        "$oag_path": "/",
        "$oag_path_method": "GET",
        description: "What more could I say?",
        external_docs: %ExternalDocumentation{
          description: "More Info",
          url: "https://google.com/"
        },
        summary: "Does stuff"
      }

      query_params = [
        %Param{description: "Something", name: "one", value_type: :string},
        %Param{description: "Something else", name: "two", value_type: :string}
      ]

      assert Operation.docstring(nil, operation, query_params) ==
               """
               Does stuff

               What more could I say?

               ## Options

                 * `one`: Something
                 * `two`: Something else

               ## Resources

                 * [More Info](https://google.com/)

               """
    end

    test "creates a docstring with request body content types only" do
      operation = %OpSpec{
        "$oag_path": "/api/endpoint",
        "$oag_path_method": "POST",
        description: nil,
        external_docs: nil,
        summary: "Creates something",
        request_body: %RequestBody{
          description: nil,
          content: %{
            "application/json" => %SchemaSpec{},
            "application/x-www-form-urlencoded" => %SchemaSpec{}
          },
          required: true
        }
      }

      assert Operation.docstring(nil, operation, []) ==
               """
               Creates something

               ## Request Body

               **Content Types**: `application/json`, `application/x-www-form-urlencoded`
               """
    end

    test "creates a docstring with request body including description" do
      operation = %OpSpec{
        "$oag_path": "/api/endpoint",
        "$oag_path_method": "POST",
        description: nil,
        external_docs: nil,
        summary: "Creates something",
        request_body: %RequestBody{
          description: "The user data to create\n\nShould include name and email fields",
          content: %{
            "application/json" => %SchemaSpec{}
          },
          required: true
        }
      }

      assert Operation.docstring(nil, operation, []) ==
               """
               Creates something

               ## Request Body

               **Content Types**: `application/json`

               The user data to create

               Should include name and email fields
               """
    end

    test "creates a docstring with everything including request body" do
      operation = %OpSpec{
        "$oag_path": "/api/endpoint",
        "$oag_path_method": "POST",
        description: "What more could I say?",
        external_docs: %ExternalDocumentation{
          description: "More Info",
          url: "https://google.com/"
        },
        summary: "Creates something",
        request_body: %RequestBody{
          description: "The request payload",
          content: %{
            "application/json" => %SchemaSpec{}
          },
          required: true
        }
      }

      query_params = [
        %Param{description: "Filter parameter", name: "filter", value_type: :string}
      ]

      assert Operation.docstring(nil, operation, query_params) ==
               """
               Creates something

               What more could I say?

               ## Options

                 * `filter`: Filter parameter

               ## Request Body

               **Content Types**: `application/json`

               The request payload

               ## Resources

                 * [More Info](https://google.com/)

               """
    end

    test "creates a docstring with empty request body spec" do
      operation = %OpSpec{
        "$oag_path": "/api/endpoint",
        "$oag_path_method": "POST",
        description: nil,
        external_docs: nil,
        summary: "Creates something",
        request_body: nil
      }

      assert Operation.docstring(nil, operation, []) ==
               """
               Creates something
               """
    end
  end
end
