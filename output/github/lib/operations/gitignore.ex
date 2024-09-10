defmodule GitHub.Gitignore do
  @moduledoc """
  Provides API endpoints related to gitignore
  """

  @default_client GitHub.Client

  @doc """
  Get all gitignore templates

  List all templates available to pass as an option when [creating a repository](https://docs.github.com/rest/repos/repos#create-a-repository-for-the-authenticated-user).

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gitignore/gitignore#get-all-gitignore-templates)

  """
  @spec get_all_templates(keyword) :: {:ok, [String.t()]} | {:error, GitHub.Error.t()}
  def get_all_templates(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.Gitignore, :get_all_templates},
      url: "/gitignore/templates",
      method: :get,
      response: [{200, [string: :generic]}, {304, :null}],
      opts: opts
    })
  end

  @doc """
  Get a gitignore template

  Get the content of a gitignore template.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw .gitignore contents.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/gitignore/gitignore#get-a-gitignore-template)

  """
  @spec get_template(String.t(), keyword) ::
          {:ok, GitHub.Git.IgnoreTemplate.t()} | {:error, GitHub.Error.t()}
  def get_template(name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name],
      call: {GitHub.Gitignore, :get_template},
      url: "/gitignore/templates/#{name}",
      method: :get,
      response: [{200, {GitHub.Git.IgnoreTemplate, :t}}, {304, :null}],
      opts: opts
    })
  end
end
