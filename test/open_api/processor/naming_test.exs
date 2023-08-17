defmodule OpenAPI.Processor.NamingTest do
  use ExUnit.Case, async: true
  doctest OpenAPI.Processor.Naming, import: true

  alias OpenAPI.Processor.Naming

  @profile __MODULE__

  setup do
    %{state: %OpenAPI.Processor.State{profile: @profile}}
  end

  describe "group_schema/2" do
    test "does nothing by default", %{state: state} do
      Application.put_env(:oapi_generator, @profile, naming: [group: []])
      assert Naming.group_schema({"TestSchema", "t"}, state) == {"TestSchema", "t"}
    end

    test "groups schema based on prefixes", %{state: state} do
      Application.put_env(:oapi_generator, @profile, naming: [group: [Test]])
      assert Naming.group_schema({"TestSchema", "t"}, state) == {"Test.Schema", "t"}
      assert Naming.group_schema({"MyTest", "t"}, state) == {"MyTest", "t"}
    end

    test "groups multiple namespaces in order", %{state: state} do
      Application.put_env(:oapi_generator, @profile, naming: [group: [My, My.Test]])
      assert Naming.group_schema({"MyTestSchema", "t"}, state) == {"My.Test.Schema", "t"}
    end
  end
end
