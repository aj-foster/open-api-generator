defmodule OpenAI.Files do
  @moduledoc """
  Provides API endpoints related to files
  """

  @default_client OpenAI.Client

  @doc """
  Upload a file that can be used across various endpoints. Individual files can be up to 512 MB, and the size of all files uploaded by one organization can be up to 100 GB.

  The Assistants API supports files up to 2 million tokens and of specific file types. See the [Assistants Tools guide](/docs/assistants/tools) for details.

  The Fine-tuning API only supports `.jsonl` files. The input also has certain required formats for fine-tuning [chat](/docs/api-reference/fine-tuning/chat-input) or [completions](/docs/api-reference/fine-tuning/completions-input) models.

  The Batch API only supports `.jsonl` files up to 200 MB in size. The input also has a specific required [format](/docs/api-reference/batch/request-input).

  Please [contact us](https://help.openai.com/) if you need to increase these storage limits.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec create_file(body :: OpenAI.CreateFileRequest.t(), opts :: keyword) ::
          {:ok, OpenAI.OpenAIFile.t()} | :error
  def create_file(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Files, :create_file},
      url: "/files",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {OpenAI.CreateFileRequest, :t}}],
      response: [{200, {OpenAI.OpenAIFile, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a file.
  """
  @spec delete_file(file_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAI.DeleteFileResponse.t()} | :error
  def delete_file(file_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [file_id: file_id],
      call: {OpenAI.Files, :delete_file},
      url: "/files/#{file_id}",
      method: :delete,
      response: [{200, {OpenAI.DeleteFileResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns the contents of the specified file.
  """
  @spec download_file(file_id :: String.t(), opts :: keyword) :: {:ok, String.t()} | :error
  def download_file(file_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [file_id: file_id],
      call: {OpenAI.Files, :download_file},
      url: "/files/#{file_id}/content",
      method: :get,
      response: [{200, :string}],
      opts: opts
    })
  end

  @doc """
  Returns a list of files.

  ## Options

    * `purpose`: Only return files with the given purpose.
    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 10,000, and the default is 10,000.
      
    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      

  """
  @spec list_files(opts :: keyword) :: {:ok, OpenAI.ListFilesResponse.t()} | :error
  def list_files(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :order, :purpose])

    client.request(%{
      args: [],
      call: {OpenAI.Files, :list_files},
      url: "/files",
      method: :get,
      query: query,
      response: [{200, {OpenAI.ListFilesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns information about a specific file.
  """
  @spec retrieve_file(file_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAI.OpenAIFile.t()} | :error
  def retrieve_file(file_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [file_id: file_id],
      call: {OpenAI.Files, :retrieve_file},
      url: "/files/#{file_id}",
      method: :get,
      response: [{200, {OpenAI.OpenAIFile, :t}}],
      opts: opts
    })
  end
end
