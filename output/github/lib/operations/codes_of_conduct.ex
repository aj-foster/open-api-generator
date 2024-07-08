defmodule GitHub.CodesOfConduct do
  @moduledoc """
  Provides API endpoints related to codes of conduct
  """

  @default_client GitHub.Client

  @doc """
  Get all codes of conduct

  Returns array of all GitHub's codes of conduct.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/codes-of-conduct/codes-of-conduct#get-all-codes-of-conduct)

  """
  @spec get_all_codes_of_conduct(keyword) ::
          {:ok, [GitHub.CodeOfConduct.t()]} | {:error, GitHub.Error.t()}
  def get_all_codes_of_conduct(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.CodesOfConduct, :get_all_codes_of_conduct},
      url: "/codes_of_conduct",
      method: :get,
      response: [{200, [{GitHub.CodeOfConduct, :t}]}, {304, :null}],
      opts: opts
    })
  end

  @doc """
  Get a code of conduct

  Returns information about the specified GitHub code of conduct.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/codes-of-conduct/codes-of-conduct#get-a-code-of-conduct)

  """
  @spec get_conduct_code(String.t(), keyword) ::
          {:ok, GitHub.CodeOfConduct.t()} | {:error, GitHub.Error.t()}
  def get_conduct_code(key, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [key: key],
      call: {GitHub.CodesOfConduct, :get_conduct_code},
      url: "/codes_of_conduct/#{key}",
      method: :get,
      response: [{200, {GitHub.CodeOfConduct, :t}}, {304, :null}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end
end
