defmodule Catalogs do
  @moduledoc """
  Provides API endpoints related to catalogs
  """

  @default_client Client

  @doc """
  Create Back In Stock Subscription

  Subscribe a profile to receive back in stock notifications. Check out [our Back in Stock API guide](https://developers.klaviyo.com/en/docs/how_to_set_up_custom_back_in_stock) for more details.

  This endpoint is specifically designed to be called from server-side applications. To create subscriptions from client-side contexts, use [POST /client/back-in-stock-subscriptions](https://developers.klaviyo.com/en/reference/create_client_back_in_stock_subscription).<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:write`
  `profiles:write`
  """
  @spec create_back_in_stock_subscription(ServerBISSubscriptionCreateQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_back_in_stock_subscription(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :create_back_in_stock_subscription},
      url: "/api/back-in-stock-subscriptions/",
      body: body,
      method: :post,
      request: [{"application/json", {ServerBISSubscriptionCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Catalog Category

  Create a new catalog category.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec create_catalog_category(CatalogCategoryCreateQuery.t(), keyword) ::
          {:ok, PostCatalogCategoryResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_catalog_category(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :create_catalog_category},
      url: "/api/catalog-categories/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogCategoryCreateQuery, :t}}],
      response: [
        {201, {PostCatalogCategoryResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Catalog Category Relationships Items

  Create a new item relationship for the given category ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec create_catalog_category_relationships_items(
          String.t(),
          CatalogCategoryItemOp.t(),
          keyword
        ) :: :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_catalog_category_relationships_items(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Catalogs, :create_catalog_category_relationships_items},
      url: "/api/catalog-categories/#{id}/relationships/items/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogCategoryItemOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Catalog Item

  Create a new catalog item.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec create_catalog_item(CatalogItemCreateQuery.t(), keyword) ::
          {:ok, PostCatalogItemResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_catalog_item(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :create_catalog_item},
      url: "/api/catalog-items/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogItemCreateQuery, :t}}],
      response: [
        {201, {PostCatalogItemResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Catalog Item Relationships Categories

  Create a new catalog category relationship for the given item ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec create_catalog_item_relationships_categories(
          String.t(),
          CatalogItemCategoryOp.t(),
          keyword
        ) :: :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_catalog_item_relationships_categories(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Catalogs, :create_catalog_item_relationships_categories},
      url: "/api/catalog-items/#{id}/relationships/categories/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogItemCategoryOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Catalog Variant

  Create a new variant for a related catalog item.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec create_catalog_variant(CatalogVariantCreateQuery.t(), keyword) ::
          {:ok, PostCatalogVariantResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_catalog_variant(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :create_catalog_variant},
      url: "/api/catalog-variants/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogVariantCreateQuery, :t}}],
      response: [
        {201, {PostCatalogVariantResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec delete_catalog_category(String.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_catalog_category(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Catalogs, :delete_catalog_category},
      url: "/api/catalog-categories/#{id}/",
      method: :delete,
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Catalog Category Relationships Items

  Delete item relationships for the given category ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec delete_catalog_category_relationships_items(
          String.t(),
          CatalogCategoryItemOp.t(),
          keyword
        ) :: :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_catalog_category_relationships_items(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Catalogs, :delete_catalog_category_relationships_items},
      url: "/api/catalog-categories/#{id}/relationships/items/",
      body: body,
      method: :delete,
      request: [{"application/json", {CatalogCategoryItemOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec delete_catalog_item(String.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_catalog_item(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Catalogs, :delete_catalog_item},
      url: "/api/catalog-items/#{id}/",
      method: :delete,
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Catalog Item Relationships Categories

  Delete catalog category relationships for the given item ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec delete_catalog_item_relationships_categories(
          String.t(),
          CatalogItemCategoryOp.t(),
          keyword
        ) :: :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_catalog_item_relationships_categories(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Catalogs, :delete_catalog_item_relationships_categories},
      url: "/api/catalog-items/#{id}/relationships/categories/",
      body: body,
      method: :delete,
      request: [{"application/json", {CatalogItemCategoryOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec delete_catalog_variant(String.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_catalog_variant(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Catalogs, :delete_catalog_variant},
      url: "/api/catalog-variants/#{id}/",
      method: :delete,
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_catalog_categories(keyword) ::
          {:ok, GetCatalogCategoryResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_catalog_categories(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-category]", :filter, :"page[cursor]", :sort])

    client.request(%{
      args: [],
      call: {Catalogs, :get_catalog_categories},
      url: "/api/catalog-categories/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogCategoryResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_catalog_category(String.t(), keyword) ::
          {:ok, GetCatalogCategoryResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_catalog_category(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-category]"])

    client.request(%{
      args: [id: id],
      call: {Catalogs, :get_catalog_category},
      url: "/api/catalog-categories/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogCategoryResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_catalog_category_items(String.t(), keyword) ::
          {:ok, GetCatalogItemResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
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
      call: {Catalogs, :get_catalog_category_items},
      url: "/api/catalog-categories/#{id}/items/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogItemResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_catalog_category_relationships_items(String.t(), keyword) ::
          {:ok, GetCatalogCategoryItemListResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_catalog_category_relationships_items(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"page[cursor]"])

    client.request(%{
      args: [id: id],
      call: {Catalogs, :get_catalog_category_relationships_items},
      url: "/api/catalog-categories/#{id}/relationships/items/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogCategoryItemListResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_catalog_item(String.t(), keyword) ::
          {:ok, GetCatalogItemResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_catalog_item(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-item]", :"fields[catalog-variant]", :include])

    client.request(%{
      args: [id: id],
      call: {Catalogs, :get_catalog_item},
      url: "/api/catalog-items/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogItemResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_catalog_item_categories(String.t(), keyword) ::
          {:ok, GetCatalogCategoryResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_catalog_item_categories(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-category]", :filter, :"page[cursor]", :sort])

    client.request(%{
      args: [id: id],
      call: {Catalogs, :get_catalog_item_categories},
      url: "/api/catalog-items/#{id}/categories/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogCategoryResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_catalog_item_relationships_categories(String.t(), keyword) ::
          {:ok, GetCatalogItemCategoryListResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_catalog_item_relationships_categories(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"page[cursor]"])

    client.request(%{
      args: [id: id],
      call: {Catalogs, :get_catalog_item_relationships_categories},
      url: "/api/catalog-items/#{id}/relationships/categories/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogItemCategoryListResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_catalog_item_variants(String.t(), keyword) ::
          {:ok, GetCatalogVariantResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_catalog_item_variants(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-variant]", :filter, :"page[cursor]", :sort])

    client.request(%{
      args: [id: id],
      call: {Catalogs, :get_catalog_item_variants},
      url: "/api/catalog-items/#{id}/variants/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogVariantResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_catalog_items(keyword) ::
          {:ok, GetCatalogItemResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
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
      call: {Catalogs, :get_catalog_items},
      url: "/api/catalog-items/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogItemResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_catalog_variant(String.t(), keyword) ::
          {:ok, GetCatalogVariantResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_catalog_variant(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-variant]"])

    client.request(%{
      args: [id: id],
      call: {Catalogs, :get_catalog_variant},
      url: "/api/catalog-variants/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogVariantResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_catalog_variants(keyword) ::
          {:ok, GetCatalogVariantResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_catalog_variants(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-variant]", :filter, :"page[cursor]", :sort])

    client.request(%{
      args: [],
      call: {Catalogs, :get_catalog_variants},
      url: "/api/catalog-variants/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogVariantResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_create_categories_job(String.t(), keyword) ::
          {:ok, GetCatalogCategoryCreateJobResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
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
      call: {Catalogs, :get_create_categories_job},
      url: "/api/catalog-category-bulk-create-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogCategoryCreateJobResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_create_categories_jobs(keyword) ::
          {:ok, GetCatalogCategoryCreateJobResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_create_categories_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-category-bulk-create-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Catalogs, :get_create_categories_jobs},
      url: "/api/catalog-category-bulk-create-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogCategoryCreateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_create_items_job(String.t(), keyword) ::
          {:ok, GetCatalogItemCreateJobResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
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
      call: {Catalogs, :get_create_items_job},
      url: "/api/catalog-item-bulk-create-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogItemCreateJobResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_create_items_jobs(keyword) ::
          {:ok, GetCatalogItemCreateJobResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_create_items_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-item-bulk-create-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Catalogs, :get_create_items_jobs},
      url: "/api/catalog-item-bulk-create-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogItemCreateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_create_variants_job(String.t(), keyword) ::
          {:ok, GetCatalogVariantCreateJobResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
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
      call: {Catalogs, :get_create_variants_job},
      url: "/api/catalog-variant-bulk-create-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogVariantCreateJobResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_create_variants_jobs(keyword) ::
          {:ok, GetCatalogVariantCreateJobResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_create_variants_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-variant-bulk-create-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Catalogs, :get_create_variants_jobs},
      url: "/api/catalog-variant-bulk-create-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogVariantCreateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_delete_categories_job(String.t(), keyword) ::
          {:ok, GetCatalogCategoryDeleteJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_delete_categories_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-category-bulk-delete-job]"])

    client.request(%{
      args: [job_id: job_id],
      call: {Catalogs, :get_delete_categories_job},
      url: "/api/catalog-category-bulk-delete-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogCategoryDeleteJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_delete_categories_jobs(keyword) ::
          {:ok, GetCatalogCategoryDeleteJobResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_delete_categories_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-category-bulk-delete-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Catalogs, :get_delete_categories_jobs},
      url: "/api/catalog-category-bulk-delete-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogCategoryDeleteJobResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_delete_items_job(String.t(), keyword) ::
          {:ok, GetCatalogItemDeleteJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_delete_items_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-item-bulk-delete-job]"])

    client.request(%{
      args: [job_id: job_id],
      call: {Catalogs, :get_delete_items_job},
      url: "/api/catalog-item-bulk-delete-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogItemDeleteJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_delete_items_jobs(keyword) ::
          {:ok, GetCatalogItemDeleteJobResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_delete_items_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-item-bulk-delete-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Catalogs, :get_delete_items_jobs},
      url: "/api/catalog-item-bulk-delete-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogItemDeleteJobResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_delete_variants_job(String.t(), keyword) ::
          {:ok, GetCatalogVariantDeleteJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_delete_variants_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[catalog-variant-bulk-delete-job]"])

    client.request(%{
      args: [job_id: job_id],
      call: {Catalogs, :get_delete_variants_job},
      url: "/api/catalog-variant-bulk-delete-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogVariantDeleteJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_delete_variants_jobs(keyword) ::
          {:ok, GetCatalogVariantDeleteJobResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_delete_variants_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-variant-bulk-delete-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Catalogs, :get_delete_variants_jobs},
      url: "/api/catalog-variant-bulk-delete-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogVariantDeleteJobResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_update_categories_job(String.t(), keyword) ::
          {:ok, GetCatalogCategoryUpdateJobResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
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
      call: {Catalogs, :get_update_categories_job},
      url: "/api/catalog-category-bulk-update-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogCategoryUpdateJobResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_update_categories_jobs(keyword) ::
          {:ok, GetCatalogCategoryUpdateJobResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_update_categories_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-category-bulk-update-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Catalogs, :get_update_categories_jobs},
      url: "/api/catalog-category-bulk-update-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogCategoryUpdateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_update_items_job(String.t(), keyword) ::
          {:ok, GetCatalogItemUpdateJobResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
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
      call: {Catalogs, :get_update_items_job},
      url: "/api/catalog-item-bulk-update-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogItemUpdateJobResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_update_items_jobs(keyword) ::
          {:ok, GetCatalogItemUpdateJobResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_update_items_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-item-bulk-update-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Catalogs, :get_update_items_jobs},
      url: "/api/catalog-item-bulk-update-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogItemUpdateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_update_variants_job(String.t(), keyword) ::
          {:ok, GetCatalogVariantUpdateJobResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
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
      call: {Catalogs, :get_update_variants_job},
      url: "/api/catalog-variant-bulk-update-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogVariantUpdateJobResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  @spec get_update_variants_jobs(keyword) ::
          {:ok, GetCatalogVariantUpdateJobResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_update_variants_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[catalog-variant-bulk-update-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Catalogs, :get_update_variants_jobs},
      url: "/api/catalog-variant-bulk-update-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {GetCatalogVariantUpdateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  """
  @spec spawn_create_categories_job(CatalogCategoryCreateJobCreateQuery.t(), keyword) ::
          {:ok, PostCatalogCategoryCreateJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def spawn_create_categories_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :spawn_create_categories_job},
      url: "/api/catalog-category-bulk-create-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogCategoryCreateJobCreateQuery, :t}}],
      response: [
        {202, {PostCatalogCategoryCreateJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  """
  @spec spawn_create_items_job(CatalogItemCreateJobCreateQuery.t(), keyword) ::
          {:ok, PostCatalogItemCreateJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def spawn_create_items_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :spawn_create_items_job},
      url: "/api/catalog-item-bulk-create-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogItemCreateJobCreateQuery, :t}}],
      response: [
        {202, {PostCatalogItemCreateJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  """
  @spec spawn_create_variants_job(CatalogVariantCreateJobCreateQuery.t(), keyword) ::
          {:ok, PostCatalogVariantCreateJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def spawn_create_variants_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :spawn_create_variants_job},
      url: "/api/catalog-variant-bulk-create-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogVariantCreateJobCreateQuery, :t}}],
      response: [
        {202, {PostCatalogVariantCreateJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  """
  @spec spawn_delete_categories_job(CatalogCategoryDeleteJobCreateQuery.t(), keyword) ::
          {:ok, PostCatalogCategoryDeleteJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def spawn_delete_categories_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :spawn_delete_categories_job},
      url: "/api/catalog-category-bulk-delete-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogCategoryDeleteJobCreateQuery, :t}}],
      response: [
        {202, {PostCatalogCategoryDeleteJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  """
  @spec spawn_delete_items_job(CatalogItemDeleteJobCreateQuery.t(), keyword) ::
          {:ok, PostCatalogItemDeleteJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def spawn_delete_items_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :spawn_delete_items_job},
      url: "/api/catalog-item-bulk-delete-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogItemDeleteJobCreateQuery, :t}}],
      response: [
        {202, {PostCatalogItemDeleteJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  """
  @spec spawn_delete_variants_job(CatalogVariantDeleteJobCreateQuery.t(), keyword) ::
          {:ok, PostCatalogVariantDeleteJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def spawn_delete_variants_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :spawn_delete_variants_job},
      url: "/api/catalog-variant-bulk-delete-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogVariantDeleteJobCreateQuery, :t}}],
      response: [
        {202, {PostCatalogVariantDeleteJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  """
  @spec spawn_update_categories_job(CatalogCategoryUpdateJobCreateQuery.t(), keyword) ::
          {:ok, PostCatalogCategoryUpdateJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def spawn_update_categories_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :spawn_update_categories_job},
      url: "/api/catalog-category-bulk-update-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogCategoryUpdateJobCreateQuery, :t}}],
      response: [
        {202, {PostCatalogCategoryUpdateJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  """
  @spec spawn_update_items_job(CatalogItemUpdateJobCreateQuery.t(), keyword) ::
          {:ok, PostCatalogItemUpdateJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def spawn_update_items_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :spawn_update_items_job},
      url: "/api/catalog-item-bulk-update-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogItemUpdateJobCreateQuery, :t}}],
      response: [
        {202, {PostCatalogItemUpdateJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
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
  """
  @spec spawn_update_variants_job(CatalogVariantUpdateJobCreateQuery.t(), keyword) ::
          {:ok, PostCatalogVariantUpdateJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def spawn_update_variants_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Catalogs, :spawn_update_variants_job},
      url: "/api/catalog-variant-bulk-update-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {CatalogVariantUpdateJobCreateQuery, :t}}],
      response: [
        {202, {PostCatalogVariantUpdateJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Catalog Category

  Update a catalog category with the given category ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec update_catalog_category(String.t(), CatalogCategoryUpdateQuery.t(), keyword) ::
          {:ok, PatchCatalogCategoryResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_catalog_category(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Catalogs, :update_catalog_category},
      url: "/api/catalog-categories/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {CatalogCategoryUpdateQuery, :t}}],
      response: [
        {200, {PatchCatalogCategoryResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Catalog Category Relationships Items

  Update item relationships for the given category ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec update_catalog_category_relationships_items(
          String.t(),
          CatalogCategoryItemOp.t(),
          keyword
        ) :: :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_catalog_category_relationships_items(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Catalogs, :update_catalog_category_relationships_items},
      url: "/api/catalog-categories/#{id}/relationships/items/",
      body: body,
      method: :patch,
      request: [{"application/json", {CatalogCategoryItemOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Catalog Item

  Update a catalog item with the given item ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec update_catalog_item(String.t(), CatalogItemUpdateQuery.t(), keyword) ::
          {:ok, PatchCatalogItemResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_catalog_item(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Catalogs, :update_catalog_item},
      url: "/api/catalog-items/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {CatalogItemUpdateQuery, :t}}],
      response: [
        {200, {PatchCatalogItemResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Catalog Item Relationships Categories

  Update catalog category relationships for the given item ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec update_catalog_item_relationships_categories(
          String.t(),
          CatalogItemCategoryOp.t(),
          keyword
        ) :: :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_catalog_item_relationships_categories(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Catalogs, :update_catalog_item_relationships_categories},
      url: "/api/catalog-items/#{id}/relationships/categories/",
      body: body,
      method: :patch,
      request: [{"application/json", {CatalogItemCategoryOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Catalog Variant

  Update a catalog item variant with the given variant ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `catalogs:write`
  """
  @spec update_catalog_variant(String.t(), CatalogVariantUpdateQuery.t(), keyword) ::
          {:ok, PatchCatalogVariantResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_catalog_variant(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Catalogs, :update_catalog_variant},
      url: "/api/catalog-variants/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {CatalogVariantUpdateQuery, :t}}],
      response: [
        {200, {PatchCatalogVariantResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
