defmodule OpenAPI.Renderer.OperationTest do
  use ExUnit.Case, async: true

  alias OpenAPI.Processor.Operation
  alias OpenAPI.Renderer.Operation, as: OperationRenderer
  alias OpenAPI.Renderer.State

  describe "render_spec/2 error_fallback" do
    test "includes fallback type when undocumented errors exist and error_fallback is configured" do
      profile = :test_fallback_with_undocumented
      put_test_config(profile, error_fallback: {:string, :generic})

      state = %State{
        files: %{},
        implementation: OpenAPI.Renderer,
        operations: [],
        profile: profile,
        schemas: %{}
      }

      operation = %Operation{
        docstring: "Test",
        function_name: :test_op,
        module_name: Test.Ops,
        request_body: [],
        request_method: :get,
        request_path: "/test",
        request_path_parameters: [],
        request_query_parameters: [],
        responses: [
          {200, %{"application/json" => :map}},
          {400, %{}},
          {422, %{"application/json" => {Test.ValidationError, :t}}}
        ]
      }

      spec = OperationRenderer.render_spec(state, operation)
      spec_string = Macro.to_string(spec)

      assert spec_string =~ "String.t()"
      assert spec_string =~ "Test.ValidationError.t()"
    end

    test "does not include fallback when no undocumented errors exist" do
      profile = :test_fallback_all_documented
      put_test_config(profile, error_fallback: {:string, :generic})

      state = %State{
        files: %{},
        implementation: OpenAPI.Renderer,
        operations: [],
        profile: profile,
        schemas: %{}
      }

      operation = %Operation{
        docstring: "Test",
        function_name: :test_op,
        module_name: Test.Ops,
        request_body: [],
        request_method: :get,
        request_path: "/test",
        request_path_parameters: [],
        request_query_parameters: [],
        responses: [
          {200, %{"application/json" => :map}},
          {422, %{"application/json" => {Test.ValidationError, :t}}}
        ]
      }

      spec = OperationRenderer.render_spec(state, operation)
      spec_string = Macro.to_string(spec)

      assert spec_string =~ "Test.ValidationError.t()"
      refute spec_string =~ "| String.t()"
    end

    test "does not include fallback when error_fallback is not configured" do
      profile = :test_no_fallback_config
      put_test_config(profile, [])

      state = %State{
        files: %{},
        implementation: OpenAPI.Renderer,
        operations: [],
        profile: profile,
        schemas: %{}
      }

      operation = %Operation{
        docstring: "Test",
        function_name: :test_op,
        module_name: Test.Ops,
        request_body: [],
        request_method: :get,
        request_path: "/test",
        request_path_parameters: [],
        request_query_parameters: [],
        responses: [
          {200, %{"application/json" => :map}},
          {400, %{}},
          {422, %{"application/json" => {Test.ValidationError, :t}}}
        ]
      }

      spec = OperationRenderer.render_spec(state, operation)
      spec_string = Macro.to_string(spec)

      assert spec_string =~ "Test.ValidationError.t()"
      refute spec_string =~ "String.t()"
    end

    test "fallback works when only undocumented errors exist" do
      profile = :test_fallback_only_undocumented
      put_test_config(profile, error_fallback: {:string, :generic})

      state = %State{
        files: %{},
        implementation: OpenAPI.Renderer,
        operations: [],
        profile: profile,
        schemas: %{}
      }

      operation = %Operation{
        docstring: "Test",
        function_name: :test_op,
        module_name: Test.Ops,
        request_body: [],
        request_method: :get,
        request_path: "/test",
        request_path_parameters: [],
        request_query_parameters: [],
        responses: [
          {200, %{"application/json" => :map}},
          {400, %{}},
          {401, %{}},
          {500, %{}}
        ]
      }

      spec = OperationRenderer.render_spec(state, operation)
      spec_string = Macro.to_string(spec)

      assert spec_string =~ "{:error, String.t()}"
    end

    test "types.error overrides error_fallback" do
      profile = :test_error_overrides_fallback
      put_test_config(profile, error: {Test.Error, :t}, error_fallback: {:string, :generic})

      state = %State{
        files: %{},
        implementation: OpenAPI.Renderer,
        operations: [],
        profile: profile,
        schemas: %{}
      }

      operation = %Operation{
        docstring: "Test",
        function_name: :test_op,
        module_name: Test.Ops,
        request_body: [],
        request_method: :get,
        request_path: "/test",
        request_path_parameters: [],
        request_query_parameters: [],
        responses: [
          {200, %{"application/json" => :map}},
          {400, %{}},
          {422, %{"application/json" => {Test.ValidationError, :t}}}
        ]
      }

      spec = OperationRenderer.render_spec(state, operation)
      spec_string = Macro.to_string(spec)

      assert spec_string =~ "Test.Error.t()"
      refute spec_string =~ "String.t()"
      refute spec_string =~ "Test.ValidationError.t()"
    end
  end

  defp put_test_config(profile, types_opts) do
    Application.put_env(:oapi_generator, profile,
      output: [
        base_module: Test,
        types: types_opts
      ]
    )
  end
end
