defmodule Klaviyo.Catalogs do
  @moduledoc """
  Provides API endpoints related to catalogs
  """

  @default_client Klaviyo.Client

  @doc """
  Create Back In Stock Subscription

  Subscribe a profile to receive back in stock notifications. Check out [our Back in Stock API guide](https://developers.klaviyo.com/en/docs/how_to_set_up_custom_back_in_stock) for more details.

  This endpoint is specifically designed to be called from server-side applications. To create subscriptions from client-side contexts, use [POST /client/back-in-stock-subscriptions](https://developers.klaviyo.com/en/reference/create_client_back_in_stock_subscription).<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:write`
  `profiles:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_back_in_stock_subscription(
          body :: Klaviyo.ServerBISSubscriptionCreateQuery.t(),
          opts :: keyword
        ) :: :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_back_in_stock_subscription(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :create_back_in_stock_subscription},
      url: "/api/back-in-stock-subscriptions/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.ServerBISSubscriptionCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Catalog Category

  Create a new catalog category.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_catalog_category(body :: Klaviyo.CatalogCategoryCreateQuery.t(), opts :: keyword) ::
          {:ok, Klaviyo.PostCatalogCategoryResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_catalog_category(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :create_catalog_category},
      url: "/api/catalog-categories/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogCategoryCreateQuery, :t}}],
      response: [
        {201, {Klaviyo.PostCatalogCategoryResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Catalog Category Relationships Items

  Create a new item relationship for the given category ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_catalog_category_relationships_items(
          id :: String.t(),
          body :: Klaviyo.CatalogCategoryItemOp.t(),
          opts :: keyword
        ) :: :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_catalog_category_relationships_items(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Klaviyo.Catalogs, :create_catalog_category_relationships_items},
      url: "/api/catalog-categories/#{id}/relationships/items/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogCategoryItemOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Catalog Item

  Create a new catalog item.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_catalog_item(body :: Klaviyo.CatalogItemCreateQuery.t(), opts :: keyword) ::
          {:ok, Klaviyo.PostCatalogItemResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_catalog_item(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :create_catalog_item},
      url: "/api/catalog-items/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogItemCreateQuery, :t}}],
      response: [
        {201, {Klaviyo.PostCatalogItemResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Catalog Item Relationships Categories

  Create a new catalog category relationship for the given item ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_catalog_item_relationships_categories(
          id :: String.t(),
          body :: Klaviyo.CatalogItemCategoryOp.t(),
          opts :: keyword
        ) :: :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_catalog_item_relationships_categories(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Klaviyo.Catalogs, :create_catalog_item_relationships_categories},
      url: "/api/catalog-items/#{id}/relationships/categories/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogItemCategoryOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Catalog Variant

  Create a new variant for a related catalog item.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_catalog_variant(body :: Klaviyo.CatalogVariantCreateQuery.t(), opts :: keyword) ::
          {:ok, Klaviyo.PostCatalogVariantResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_catalog_variant(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :create_catalog_variant},
      url: "/api/catalog-variants/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogVariantCreateQuery, :t}}],
      response: [
        {201, {Klaviyo.PostCatalogVariantResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Catalog Category

  Delete a catalog category using the given category ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec delete_catalog_category(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def delete_catalog_category(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Catalogs, :delete_catalog_category},
      url: "/api/catalog-categories/#{id}/",
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
  Delete Catalog Category Relationships Items

  Delete item relationships for the given category ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec delete_catalog_category_relationships_items(
          id :: String.t(),
          body :: Klaviyo.CatalogCategoryItemOp.t(),
          opts :: keyword
        ) :: :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def delete_catalog_category_relationships_items(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Klaviyo.Catalogs, :delete_catalog_category_relationships_items},
      url: "/api/catalog-categories/#{id}/relationships/items/",
      body: body,
      method: :delete,
      request: [{"application/json", {Klaviyo.CatalogCategoryItemOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Catalog Item

  Delete a catalog item with the given item ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec delete_catalog_item(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def delete_catalog_item(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Catalogs, :delete_catalog_item},
      url: "/api/catalog-items/#{id}/",
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
  Delete Catalog Item Relationships Categories

  Delete catalog category relationships for the given item ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec delete_catalog_item_relationships_categories(
          id :: String.t(),
          body :: Klaviyo.CatalogItemCategoryOp.t(),
          opts :: keyword
        ) :: :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def delete_catalog_item_relationships_categories(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Klaviyo.Catalogs, :delete_catalog_item_relationships_categories},
      url: "/api/catalog-items/#{id}/relationships/categories/",
      body: body,
      method: :delete,
      request: [{"application/json", {Klaviyo.CatalogItemCategoryOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Catalog Variant

  Delete a catalog item variant with the given variant ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec delete_catalog_variant(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def delete_catalog_variant(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Catalogs, :delete_catalog_variant},
      url: "/api/catalog-variants/#{id}/",
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
  Get Catalog Categories

  Get all catalog categories in an account.

  Catalog categories can be sorted by the following fields, in ascending and descending order:
  `created`

  Currently, the only supported integration type is `$custom`, and the only supported catalog type is `$default`.

  Returns a maximum of 100 categories per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-category]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`ids`: `any`<br>`item.id`: `equals`<br>`name`: `contains`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_catalog_categories(opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogCategoryResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_catalog_categories(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-category]", :filter, :"page[cursor]", :sort])

    client.request(%{
      args: [],
      call: {Klaviyo.Catalogs, :get_catalog_categories},
      url: "/api/catalog-categories/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogCategoryResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Catalog Category

  Get a catalog category with the given category ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-category]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_catalog_category(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogCategoryResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_catalog_category(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-category]"])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Catalogs, :get_catalog_category},
      url: "/api/catalog-categories/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogCategoryResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Catalog Category Items

  Get all items in a category with the given category ID.

  Items can be sorted by the following fields, in ascending and descending order:
  `created`

  Returns a maximum of 100 items per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-item]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[catalog-variant]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`ids`: `any`<br>`category.id`: `equals`<br>`title`: `contains`<br>`published`: `equals`
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_catalog_category_items(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogItemResponseCollectionCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_catalog_category_items(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[catalog-item]",
        :"fields[catalog-variant]",
        :filter,
        :include,
        :"page[cursor]",
        :sort
      ])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Catalogs, :get_catalog_category_items},
      url: "/api/catalog-categories/#{id}/items/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogItemResponseCollectionCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Catalog Category Relationships Items

  Get all items in the given category ID.

  Returns a maximum of 100 items per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_catalog_category_relationships_items(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogCategoryItemListResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_catalog_category_relationships_items(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"page[cursor]"])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Catalogs, :get_catalog_category_relationships_items},
      url: "/api/catalog-categories/#{id}/relationships/items/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogCategoryItemListResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Catalog Item

  Get a specific catalog item with the given item ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-item]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[catalog-variant]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_catalog_item(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogItemResponseCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_catalog_item(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-item]", :"fields[catalog-variant]", :include])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Catalogs, :get_catalog_item},
      url: "/api/catalog-items/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogItemResponseCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Catalog Item Categories

  Get all catalog categories that an item with the given item ID is in.

  Catalog categories can be sorted by the following fields, in ascending and descending order:
  `created`

  Returns a maximum of 100 categories per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-category]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`ids`: `any`<br>`item.id`: `equals`<br>`name`: `contains`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_catalog_item_categories(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogCategoryResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_catalog_item_categories(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-category]", :filter, :"page[cursor]", :sort])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Catalogs, :get_catalog_item_categories},
      url: "/api/catalog-items/#{id}/categories/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogCategoryResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Catalog Item Relationships Categories

  Get all catalog categories that a particular item is in.

  Returns a maximum of 100 categories per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_catalog_item_relationships_categories(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogItemCategoryListResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_catalog_item_relationships_categories(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"page[cursor]"])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Catalogs, :get_catalog_item_relationships_categories},
      url: "/api/catalog-items/#{id}/relationships/categories/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogItemCategoryListResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Catalog Item Variants

  Get all variants related to the given item ID.

  Variants can be sorted by the following fields, in ascending and descending order:
  `created`

  Returns a maximum of 100 variants per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-variant]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`ids`: `any`<br>`item.id`: `equals`<br>`sku`: `equals`<br>`title`: `contains`<br>`published`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_catalog_item_variants(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogVariantResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_catalog_item_variants(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-variant]", :filter, :"page[cursor]", :sort])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Catalogs, :get_catalog_item_variants},
      url: "/api/catalog-items/#{id}/variants/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogVariantResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Catalog Items

  Get all catalog items in an account.

  Catalog items can be sorted by the following fields, in ascending and descending order:
  `created`

  Currently, the only supported integration type is `$custom`, and the only supported catalog type is `$default`.

  Returns a maximum of 100 items per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-item]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[catalog-variant]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`ids`: `any`<br>`category.id`: `equals`<br>`title`: `contains`<br>`published`: `equals`
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_catalog_items(opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogItemResponseCollectionCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_catalog_items(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[catalog-item]",
        :"fields[catalog-variant]",
        :filter,
        :include,
        :"page[cursor]",
        :sort
      ])

    client.request(%{
      args: [],
      call: {Klaviyo.Catalogs, :get_catalog_items},
      url: "/api/catalog-items/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogItemResponseCollectionCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Catalog Variant

  Get a catalog item variant with the given variant ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-variant]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_catalog_variant(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogVariantResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_catalog_variant(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-variant]"])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Catalogs, :get_catalog_variant},
      url: "/api/catalog-variants/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogVariantResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Catalog Variants

  Get all variants in an account.

  Variants can be sorted by the following fields, in ascending and descending order:
  `created`

  Currently, the only supported integration type is `$custom`, and the only supported catalog type is `$default`.

  Returns a maximum of 100 variants per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-variant]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`ids`: `any`<br>`item.id`: `equals`<br>`sku`: `equals`<br>`title`: `contains`<br>`published`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_catalog_variants(opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogVariantResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_catalog_variants(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-variant]", :filter, :"page[cursor]", :sort])

    client.request(%{
      args: [],
      call: {Klaviyo.Catalogs, :get_catalog_variants},
      url: "/api/catalog-variants/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogVariantResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Create Categories Job

  Get a catalog category bulk create job with the given job ID.

  An `include` parameter can be provided to get the following related resource data: `categories`.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-category-bulk-create-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[catalog-category]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_create_categories_job(job_id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogCategoryCreateJobResponseCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_create_categories_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[catalog-category-bulk-create-job]",
        :"fields[catalog-category]",
        :include
      ])

    client.request(%{
      args: [job_id: job_id],
      call: {Klaviyo.Catalogs, :get_create_categories_job},
      url: "/api/catalog-category-bulk-create-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogCategoryCreateJobResponseCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Create Categories Jobs

  Get all catalog category bulk create jobs.

  Returns a maximum of 100 jobs per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-category-bulk-create-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`status`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_create_categories_jobs(opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogCategoryCreateJobResponseCollectionCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_create_categories_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-category-bulk-create-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Klaviyo.Catalogs, :get_create_categories_jobs},
      url: "/api/catalog-category-bulk-create-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogCategoryCreateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Create Items Job

  Get a catalog item bulk create job with the given job ID.

  An `include` parameter can be provided to get the following related resource data: `items`.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-item-bulk-create-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[catalog-item]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_create_items_job(job_id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogItemCreateJobResponseCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_create_items_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[catalog-item-bulk-create-job]",
        :"fields[catalog-item]",
        :include
      ])

    client.request(%{
      args: [job_id: job_id],
      call: {Klaviyo.Catalogs, :get_create_items_job},
      url: "/api/catalog-item-bulk-create-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogItemCreateJobResponseCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Create Items Jobs

  Get all catalog item bulk create jobs.

  Returns a maximum of 100 jobs per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-item-bulk-create-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`status`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_create_items_jobs(opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogItemCreateJobResponseCollectionCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_create_items_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-item-bulk-create-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Klaviyo.Catalogs, :get_create_items_jobs},
      url: "/api/catalog-item-bulk-create-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogItemCreateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Create Variants Job

  Get a catalog variant bulk create job with the given job ID.

  An `include` parameter can be provided to get the following related resource data: `variants`.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-variant-bulk-create-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[catalog-variant]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_create_variants_job(job_id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogVariantCreateJobResponseCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_create_variants_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[catalog-variant-bulk-create-job]",
        :"fields[catalog-variant]",
        :include
      ])

    client.request(%{
      args: [job_id: job_id],
      call: {Klaviyo.Catalogs, :get_create_variants_job},
      url: "/api/catalog-variant-bulk-create-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogVariantCreateJobResponseCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Create Variants Jobs

  Get all catalog variant bulk create jobs.

  Returns a maximum of 100 jobs per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-variant-bulk-create-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`status`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_create_variants_jobs(opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogVariantCreateJobResponseCollectionCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_create_variants_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-variant-bulk-create-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Klaviyo.Catalogs, :get_create_variants_jobs},
      url: "/api/catalog-variant-bulk-create-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogVariantCreateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Delete Categories Job

  Get a catalog category bulk delete job with the given job ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-category-bulk-delete-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_delete_categories_job(job_id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogCategoryDeleteJobResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_delete_categories_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-category-bulk-delete-job]"])

    client.request(%{
      args: [job_id: job_id],
      call: {Klaviyo.Catalogs, :get_delete_categories_job},
      url: "/api/catalog-category-bulk-delete-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogCategoryDeleteJobResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Delete Categories Jobs

  Get all catalog category bulk delete jobs.

  Returns a maximum of 100 jobs per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-category-bulk-delete-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`status`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_delete_categories_jobs(opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogCategoryDeleteJobResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_delete_categories_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-category-bulk-delete-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Klaviyo.Catalogs, :get_delete_categories_jobs},
      url: "/api/catalog-category-bulk-delete-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogCategoryDeleteJobResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Delete Items Job

  Get a catalog item bulk delete job with the given job ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-item-bulk-delete-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_delete_items_job(job_id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogItemDeleteJobResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_delete_items_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-item-bulk-delete-job]"])

    client.request(%{
      args: [job_id: job_id],
      call: {Klaviyo.Catalogs, :get_delete_items_job},
      url: "/api/catalog-item-bulk-delete-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogItemDeleteJobResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Delete Items Jobs

  Get all catalog item bulk delete jobs.

  Returns a maximum of 100 jobs per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-item-bulk-delete-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`status`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_delete_items_jobs(opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogItemDeleteJobResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_delete_items_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-item-bulk-delete-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Klaviyo.Catalogs, :get_delete_items_jobs},
      url: "/api/catalog-item-bulk-delete-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogItemDeleteJobResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Delete Variants Job

  Get a catalog variant bulk delete job with the given job ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-variant-bulk-delete-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_delete_variants_job(job_id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogVariantDeleteJobResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_delete_variants_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-variant-bulk-delete-job]"])

    client.request(%{
      args: [job_id: job_id],
      call: {Klaviyo.Catalogs, :get_delete_variants_job},
      url: "/api/catalog-variant-bulk-delete-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogVariantDeleteJobResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Delete Variants Jobs

  Get all catalog variant bulk delete jobs.

  Returns a maximum of 100 jobs per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-variant-bulk-delete-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`status`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_delete_variants_jobs(opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogVariantDeleteJobResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_delete_variants_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-variant-bulk-delete-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Klaviyo.Catalogs, :get_delete_variants_jobs},
      url: "/api/catalog-variant-bulk-delete-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogVariantDeleteJobResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Update Categories Job

  Get a catalog category bulk update job with the given job ID.

  An `include` parameter can be provided to get the following related resource data: `categories`.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-category-bulk-update-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[catalog-category]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_update_categories_job(job_id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogCategoryUpdateJobResponseCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_update_categories_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[catalog-category-bulk-update-job]",
        :"fields[catalog-category]",
        :include
      ])

    client.request(%{
      args: [job_id: job_id],
      call: {Klaviyo.Catalogs, :get_update_categories_job},
      url: "/api/catalog-category-bulk-update-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogCategoryUpdateJobResponseCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Update Categories Jobs

  Get all catalog category bulk update jobs.

  Returns a maximum of 100 jobs per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-category-bulk-update-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`status`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_update_categories_jobs(opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogCategoryUpdateJobResponseCollectionCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_update_categories_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-category-bulk-update-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Klaviyo.Catalogs, :get_update_categories_jobs},
      url: "/api/catalog-category-bulk-update-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogCategoryUpdateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Update Items Job

  Get a catalog item bulk update job with the given job ID.

  An `include` parameter can be provided to get the following related resource data: `items`.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-item-bulk-update-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[catalog-item]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_update_items_job(job_id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogItemUpdateJobResponseCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_update_items_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[catalog-item-bulk-update-job]",
        :"fields[catalog-item]",
        :include
      ])

    client.request(%{
      args: [job_id: job_id],
      call: {Klaviyo.Catalogs, :get_update_items_job},
      url: "/api/catalog-item-bulk-update-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogItemUpdateJobResponseCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Update Items Jobs

  Get all catalog item bulk update jobs.

  Returns a maximum of 100 jobs per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-item-bulk-update-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`status`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_update_items_jobs(opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogItemUpdateJobResponseCollectionCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_update_items_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-item-bulk-update-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Klaviyo.Catalogs, :get_update_items_jobs},
      url: "/api/catalog-item-bulk-update-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogItemUpdateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Update Variants Job

  Get a catalog variate bulk update job with the given job ID.

  An `include` parameter can be provided to get the following related resource data: `variants`.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-variant-bulk-update-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[catalog-variant]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_update_variants_job(job_id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogVariantUpdateJobResponseCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_update_variants_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[catalog-variant-bulk-update-job]",
        :"fields[catalog-variant]",
        :include
      ])

    client.request(%{
      args: [job_id: job_id],
      call: {Klaviyo.Catalogs, :get_update_variants_job},
      url: "/api/catalog-variant-bulk-update-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogVariantUpdateJobResponseCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Update Variants Jobs

  Get all catalog variant bulk update jobs.

  Returns a maximum of 100 jobs per request.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:read`

  ## Options

    * `fields[catalog-variant-bulk-update-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`status`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_update_variants_jobs(opts :: keyword) ::
          {:ok, Klaviyo.GetCatalogVariantUpdateJobResponseCollectionCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_update_variants_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-variant-bulk-update-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Klaviyo.Catalogs, :get_update_variants_jobs},
      url: "/api/catalog-variant-bulk-update-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetCatalogVariantUpdateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Spawn Create Categories Job

  Create a catalog category bulk create job to create a batch of catalog categories.

  Accepts up to 100 catalog categories per request. The maximum allowed payload size is 5MB.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec spawn_create_categories_job(
          body :: Klaviyo.CatalogCategoryCreateJobCreateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PostCatalogCategoryCreateJobResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def spawn_create_categories_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :spawn_create_categories_job},
      url: "/api/catalog-category-bulk-create-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogCategoryCreateJobCreateQuery, :t}}],
      response: [
        {202, {Klaviyo.PostCatalogCategoryCreateJobResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Spawn Create Items Job

  Create a catalog item bulk create job to create a batch of catalog items.

  Accepts up to 100 catalog items per request. The maximum allowed payload size is 5MB.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec spawn_create_items_job(
          body :: Klaviyo.CatalogItemCreateJobCreateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PostCatalogItemCreateJobResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def spawn_create_items_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :spawn_create_items_job},
      url: "/api/catalog-item-bulk-create-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogItemCreateJobCreateQuery, :t}}],
      response: [
        {202, {Klaviyo.PostCatalogItemCreateJobResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Spawn Create Variants Job

  Create a catalog variant bulk create job to create a batch of catalog variants.

  Accepts up to 100 catalog variants per request. The maximum allowed payload size is 5MB.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec spawn_create_variants_job(
          body :: Klaviyo.CatalogVariantCreateJobCreateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PostCatalogVariantCreateJobResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def spawn_create_variants_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :spawn_create_variants_job},
      url: "/api/catalog-variant-bulk-create-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogVariantCreateJobCreateQuery, :t}}],
      response: [
        {202, {Klaviyo.PostCatalogVariantCreateJobResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Spawn Delete Categories Job

  Create a catalog category bulk delete job to delete a batch of catalog categories.

  Accepts up to 100 catalog categories per request. The maximum allowed payload size is 5MB.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec spawn_delete_categories_job(
          body :: Klaviyo.CatalogCategoryDeleteJobCreateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PostCatalogCategoryDeleteJobResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def spawn_delete_categories_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :spawn_delete_categories_job},
      url: "/api/catalog-category-bulk-delete-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogCategoryDeleteJobCreateQuery, :t}}],
      response: [
        {202, {Klaviyo.PostCatalogCategoryDeleteJobResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Spawn Delete Items Job

  Create a catalog item bulk delete job to delete a batch of catalog items.

  Accepts up to 100 catalog items per request. The maximum allowed payload size is 5MB.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec spawn_delete_items_job(
          body :: Klaviyo.CatalogItemDeleteJobCreateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PostCatalogItemDeleteJobResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def spawn_delete_items_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :spawn_delete_items_job},
      url: "/api/catalog-item-bulk-delete-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogItemDeleteJobCreateQuery, :t}}],
      response: [
        {202, {Klaviyo.PostCatalogItemDeleteJobResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Spawn Delete Variants Job

  Create a catalog variant bulk delete job to delete a batch of catalog variants.

  Accepts up to 100 catalog variants per request. The maximum allowed payload size is 5MB.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec spawn_delete_variants_job(
          body :: Klaviyo.CatalogVariantDeleteJobCreateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PostCatalogVariantDeleteJobResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def spawn_delete_variants_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :spawn_delete_variants_job},
      url: "/api/catalog-variant-bulk-delete-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogVariantDeleteJobCreateQuery, :t}}],
      response: [
        {202, {Klaviyo.PostCatalogVariantDeleteJobResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Spawn Update Categories Job

  Create a catalog category bulk update job to update a batch of catalog categories.

  Accepts up to 100 catalog categories per request. The maximum allowed payload size is 5MB.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec spawn_update_categories_job(
          body :: Klaviyo.CatalogCategoryUpdateJobCreateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PostCatalogCategoryUpdateJobResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def spawn_update_categories_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :spawn_update_categories_job},
      url: "/api/catalog-category-bulk-update-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogCategoryUpdateJobCreateQuery, :t}}],
      response: [
        {202, {Klaviyo.PostCatalogCategoryUpdateJobResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Spawn Update Items Job

  Create a catalog item bulk update job to update a batch of catalog items.

  Accepts up to 100 catalog items per request. The maximum allowed payload size is 5MB.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec spawn_update_items_job(
          body :: Klaviyo.CatalogItemUpdateJobCreateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PostCatalogItemUpdateJobResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def spawn_update_items_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :spawn_update_items_job},
      url: "/api/catalog-item-bulk-update-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogItemUpdateJobCreateQuery, :t}}],
      response: [
        {202, {Klaviyo.PostCatalogItemUpdateJobResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Spawn Update Variants Job

  Create a catalog variant bulk update job to update a batch of catalog variants.

  Accepts up to 100 catalog variants per request. The maximum allowed payload size is 5MB.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec spawn_update_variants_job(
          body :: Klaviyo.CatalogVariantUpdateJobCreateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PostCatalogVariantUpdateJobResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def spawn_update_variants_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Catalogs, :spawn_update_variants_job},
      url: "/api/catalog-variant-bulk-update-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {Klaviyo.CatalogVariantUpdateJobCreateQuery, :t}}],
      response: [
        {202, {Klaviyo.PostCatalogVariantUpdateJobResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Catalog Category

  Update a catalog category with the given category ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_catalog_category(
          id :: String.t(),
          body :: Klaviyo.CatalogCategoryUpdateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PatchCatalogCategoryResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def update_catalog_category(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Klaviyo.Catalogs, :update_catalog_category},
      url: "/api/catalog-categories/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {Klaviyo.CatalogCategoryUpdateQuery, :t}}],
      response: [
        {200, {Klaviyo.PatchCatalogCategoryResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Catalog Category Relationships Items

  Update item relationships for the given category ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_catalog_category_relationships_items(
          id :: String.t(),
          body :: Klaviyo.CatalogCategoryItemOp.t(),
          opts :: keyword
        ) :: :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def update_catalog_category_relationships_items(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Klaviyo.Catalogs, :update_catalog_category_relationships_items},
      url: "/api/catalog-categories/#{id}/relationships/items/",
      body: body,
      method: :patch,
      request: [{"application/json", {Klaviyo.CatalogCategoryItemOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Catalog Item

  Update a catalog item with the given item ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_catalog_item(
          id :: String.t(),
          body :: Klaviyo.CatalogItemUpdateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PatchCatalogItemResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def update_catalog_item(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Klaviyo.Catalogs, :update_catalog_item},
      url: "/api/catalog-items/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {Klaviyo.CatalogItemUpdateQuery, :t}}],
      response: [
        {200, {Klaviyo.PatchCatalogItemResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Catalog Item Relationships Categories

  Update catalog category relationships for the given item ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_catalog_item_relationships_categories(
          id :: String.t(),
          body :: Klaviyo.CatalogItemCategoryOp.t(),
          opts :: keyword
        ) :: :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def update_catalog_item_relationships_categories(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Klaviyo.Catalogs, :update_catalog_item_relationships_categories},
      url: "/api/catalog-items/#{id}/relationships/categories/",
      body: body,
      method: :patch,
      request: [{"application/json", {Klaviyo.CatalogItemCategoryOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Catalog Variant

  Update a catalog item variant with the given variant ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_catalog_variant(
          id :: String.t(),
          body :: Klaviyo.CatalogVariantUpdateQuery.t(),
          opts :: keyword
        ) ::
          {:ok, Klaviyo.PatchCatalogVariantResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def update_catalog_variant(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Klaviyo.Catalogs, :update_catalog_variant},
      url: "/api/catalog-variants/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {Klaviyo.CatalogVariantUpdateQuery, :t}}],
      response: [
        {200, {Klaviyo.PatchCatalogVariantResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
