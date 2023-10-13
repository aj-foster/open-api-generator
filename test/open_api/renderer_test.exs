defmodule OpenAPI.Test.RendererTest do
  use OpenAPI.Test.RecorderCase

  test "test query parameters" do
    run_fixture(:cookie_header_params)
    %{file: %{contents: contents}, state: state} = output_file("operations.ex")

    assert_contains_code(
      contents,
      """
      header_parameters =
        Keyword.take(opts, [:header_param])
        |> Enum.map(fn {:header_param, value} -> {"X-Header-Param", value} end)
      """
    )

    assert contains_code?(
             contents,
             """
             cookie_parameters =
               Keyword.take(opts, [:cookie_param])
               |> Enum.map(fn {:cookie_param, value} -> {"cookie-param", value} end)
             """
           )
  end
end
