defmodule OpenAPI.Processor.OperationTest do
  use ExUnit.Case, async: true

  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Operation.Param
  alias OpenAPI.Spec.ExternalDocumentation
  alias OpenAPI.Spec.Path.Operation, as: OpSpec

  describe "docstring/2" do
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
  end
end
