defmodule Klaviyo.Templates do
  @moduledoc """
  Provides API endpoints related to templates
  """

  @default_client Klaviyo.Client

  @doc """
  Create Template

  Create a new custom HTML template.

  If there are 1,000 or more templates in an account, creation will fail as there is a limit of 1,000 templates
  that can be created via the API.

  Request specific fields using [sparse fieldsets](https://developers.klaviyo.com/en/reference/api_overview#sparse-fieldsets).<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `templates:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_template(body :: Klaviyo.TemplateCreateQuery.t(), opts :: keyword) ::
          {:ok, Klaviyo.PostTemplateResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_template(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Templates, :create_template},
      url: "/api/templates/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.TemplateCreateQuery, :t}}],
      response: [
        {201, {Klaviyo.PostTemplateResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Template Clone

  Create a clone of a template with the given template ID.

  If there are 1,000 or more templates in an account, cloning will fail as there is a limit of 1,000 templates
  that can be created via the API.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `templates:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_template_clone(body :: Klaviyo.TemplateCloneQuery.t(), opts :: keyword) ::
          {:ok, Klaviyo.PostTemplateResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_template_clone(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Templates, :create_template_clone},
      url: "/api/template-clone/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.TemplateCloneQuery, :t}}],
      response: [
        {201, {Klaviyo.PostTemplateResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Template Render

  Render a template with the given template ID and context attribute. Returns the HTML and plain text versions of the email template.

  **Request body parameters** (nested under `attributes`):

  * `return_fields`: Request specific fields using [sparse fieldsets](https://developers.klaviyo.com/en/reference/api_overview#sparse-fieldsets).

  * `context`: This is the context your email template will be rendered with. You must pass in a `context` object as a JSON object.

  Email templates are rendered with contexts in a similar manner to Django templates. Nested template variables can be referenced via dot notation. Template variables without corresponding `context` values are treated as `FALSE` and output nothing.

  Ex. `{ "name" : "George Washington", "state" : "VA" }`<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `templates:read`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_template_render(body :: Klaviyo.TemplateRenderQuery.t(), opts :: keyword) ::
          {:ok, Klaviyo.PostTemplateResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_template_render(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Templates, :create_template_render},
      url: "/api/template-render/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.TemplateRenderQuery, :t}}],
      response: [
        {201, {Klaviyo.PostTemplateResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Template

  Delete a template with the given template ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `templates:write`
  """
  @spec delete_template(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def delete_template(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Templates, :delete_template},
      url: "/api/templates/#{id}/",
      method: :delete,
      response: [
        {204, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Template

  Get a template with the given template ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `templates:read`

  ## Options

    * `fields[template]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_template(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetTemplateResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_template(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[template]"])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Templates, :get_template},
      url: "/api/templates/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetTemplateResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Templates

  Get all templates in an account.

  Filter to request a subset of all templates. Templates can be sorted by the following fields, in ascending and descending order: `id`, `name`, `created`, `updated`

  Returns a maximum of 10 results per page.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `templates:read`

  ## Options

    * `fields[template]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`id`: `any`, `equals`<br>`name`: `any`, `equals`<br>`created`: `equals`, `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`updated`: `equals`, `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_templates(opts :: keyword) ::
          {:ok, Klaviyo.GetTemplateResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_templates(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[template]", :filter, :"page[cursor]", :sort])

    client.request(%{
      args: [],
      call: {Klaviyo.Templates, :get_templates},
      url: "/api/templates/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetTemplateResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Template

  Update a template with the given template ID. Does not currently update drag & drop templates.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `templates:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_template(
          id :: String.t(),
          body :: Klaviyo.TemplateUpdateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PatchTemplateResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def update_template(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Klaviyo.Templates, :update_template},
      url: "/api/templates/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {Klaviyo.TemplateUpdateQuery, :t}}],
      response: [
        {200, {Klaviyo.PatchTemplateResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
