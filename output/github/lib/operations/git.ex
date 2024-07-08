defmodule GitHub.Git do
  @moduledoc """
  Provides API endpoints related to git
  """

  @default_client GitHub.Client

  @doc """
  Create a blob

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/blobs#create-a-blob)

  """
  @spec create_blob(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.ShortBlob.t()} | {:error, GitHub.Error.t()}
  def create_blob(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.Git, :create_blob},
      url: "/repos/#{owner}/#{repo}/git/blobs",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.ShortBlob, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {409, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a commit

  Creates a new Git [commit object](https://git-scm.com/book/en/v2/Git-Internals-Git-Objects).

  **Signature verification object**

  The response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:

  | Name | Type | Description |
  | ---- | ---- | ----------- |
  | `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |
  | `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in the table below. |
  | `signature` | `string` | The signature that was extracted from the commit. |
  | `payload` | `string` | The value that was signed. |

  These are the possible values for `reason` in the `verification` object:

  | Value | Description |
  | ----- | ----------- |
  | `expired_key` | The key that made the signature is expired. |
  | `not_signing_key` | The "signing" flag is not among the usage flags in the GPG key that made the signature. |
  | `gpgverify_error` | There was an error communicating with the signature verification service. |
  | `gpgverify_unavailable` | The signature verification service is currently unavailable. |
  | `unsigned` | The object does not include a signature. |
  | `unknown_signature_type` | A non-PGP signature was found in the commit. |
  | `no_user` | No user was associated with the `committer` email address in the commit. |
  | `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |
  | `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |
  | `unknown_key` | The key that made the signature has not been registered with any user's account. |
  | `malformed_signature` | There was an error parsing the signature. |
  | `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |
  | `valid` | None of the above errors applied, so the signature is considered to be verified. |

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/commits#create-a-commit)

  """
  @spec create_commit(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Git.Commit.t()} | {:error, GitHub.Error.t()}
  def create_commit(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.Git, :create_commit},
      url: "/repos/#{owner}/#{repo}/git/commits",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Git.Commit, :t}},
        {404, {GitHub.BasicError, :t}},
        {409, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a reference

  Creates a reference for your repository. You are unable to create new references for empty repositories, even if the commit SHA-1 hash used exists. Empty repositories are repositories without branches.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/refs#create-a-reference)

  """
  @spec create_ref(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Git.Ref.t()} | {:error, GitHub.Error.t()}
  def create_ref(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.Git, :create_ref},
      url: "/repos/#{owner}/#{repo}/git/refs",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Git.Ref, :t}},
        {409, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a tag object

  Note that creating a tag object does not create the reference that makes a tag in Git. If you want to create an annotated tag in Git, you have to do this call to create the tag object, and then [create](https://docs.github.com/rest/git/refs#create-a-reference) the `refs/tags/[tag]` reference. If you want to create a lightweight tag, you only have to [create](https://docs.github.com/rest/git/refs#create-a-reference) the tag reference - this call would be unnecessary.

  **Signature verification object**

  The response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:

  | Name | Type | Description |
  | ---- | ---- | ----------- |
  | `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |
  | `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in table below. |
  | `signature` | `string` | The signature that was extracted from the commit. |
  | `payload` | `string` | The value that was signed. |

  These are the possible values for `reason` in the `verification` object:

  | Value | Description |
  | ----- | ----------- |
  | `expired_key` | The key that made the signature is expired. |
  | `not_signing_key` | The "signing" flag is not among the usage flags in the GPG key that made the signature. |
  | `gpgverify_error` | There was an error communicating with the signature verification service. |
  | `gpgverify_unavailable` | The signature verification service is currently unavailable. |
  | `unsigned` | The object does not include a signature. |
  | `unknown_signature_type` | A non-PGP signature was found in the commit. |
  | `no_user` | No user was associated with the `committer` email address in the commit. |
  | `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |
  | `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |
  | `unknown_key` | The key that made the signature has not been registered with any user's account. |
  | `malformed_signature` | There was an error parsing the signature. |
  | `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |
  | `valid` | None of the above errors applied, so the signature is considered to be verified. |

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/tags#create-a-tag-object)

  """
  @spec create_tag(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Git.Tag.t()} | {:error, GitHub.Error.t()}
  def create_tag(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.Git, :create_tag},
      url: "/repos/#{owner}/#{repo}/git/tags",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Git.Tag, :t}},
        {409, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a tree

  The tree creation API accepts nested entries. If you specify both a tree and a nested path modifying that tree, this endpoint will overwrite the contents of the tree with the new path contents, and create a new tree structure.

  If you use this endpoint to add, delete, or modify the file contents in a tree, you will need to commit the tree and then update a branch to point to the commit. For more information see "[Create a commit](https://docs.github.com/rest/git/commits#create-a-commit)" and "[Update a reference](https://docs.github.com/rest/git/refs#update-a-reference)."

  Returns an error if you try to delete a file that does not exist.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/trees#create-a-tree)

  """
  @spec create_tree(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Git.Tree.t()} | {:error, GitHub.Error.t()}
  def create_tree(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.Git, :create_tree},
      url: "/repos/#{owner}/#{repo}/git/trees",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Git.Tree, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {409, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a reference

  Deletes the provided reference.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/refs#delete-a-reference)

  """
  @spec delete_ref(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def delete_ref(owner, repo, ref, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, ref: ref],
      call: {GitHub.Git, :delete_ref},
      url: "/repos/#{owner}/#{repo}/git/refs/#{ref}",
      method: :delete,
      response: [
        {204, :null},
        {409, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a blob

  The `content` in the response will always be Base64 encoded.

  This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

  - **`application/vnd.github.raw+json`**: Returns the raw blob data.
  - **`application/vnd.github+json`**: Returns a JSON representation of the blob with `content` as a base64 encoded string. This is the default if no media type is specified.

  **Note** This endpoint supports blobs up to 100 megabytes in size.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/blobs#get-a-blob)

  """
  @spec get_blob(String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.Blob.t()} | {:error, GitHub.Error.t()}
  def get_blob(owner, repo, file_sha, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, file_sha: file_sha],
      call: {GitHub.Git, :get_blob},
      url: "/repos/#{owner}/#{repo}/git/blobs/#{file_sha}",
      method: :get,
      response: [
        {200, {GitHub.Blob, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {409, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a commit object

  Gets a Git [commit object](https://git-scm.com/book/en/v2/Git-Internals-Git-Objects).

  To get the contents of a commit, see "[Get a commit](/rest/commits/commits#get-a-commit)."

  **Signature verification object**

  The response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:

  | Name | Type | Description |
  | ---- | ---- | ----------- |
  | `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |
  | `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in the table below. |
  | `signature` | `string` | The signature that was extracted from the commit. |
  | `payload` | `string` | The value that was signed. |

  These are the possible values for `reason` in the `verification` object:

  | Value | Description |
  | ----- | ----------- |
  | `expired_key` | The key that made the signature is expired. |
  | `not_signing_key` | The "signing" flag is not among the usage flags in the GPG key that made the signature. |
  | `gpgverify_error` | There was an error communicating with the signature verification service. |
  | `gpgverify_unavailable` | The signature verification service is currently unavailable. |
  | `unsigned` | The object does not include a signature. |
  | `unknown_signature_type` | A non-PGP signature was found in the commit. |
  | `no_user` | No user was associated with the `committer` email address in the commit. |
  | `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |
  | `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |
  | `unknown_key` | The key that made the signature has not been registered with any user's account. |
  | `malformed_signature` | There was an error parsing the signature. |
  | `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |
  | `valid` | None of the above errors applied, so the signature is considered to be verified. |

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/commits#get-a-commit-object)

  """
  @spec get_commit(String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.Git.Commit.t()} | {:error, GitHub.Error.t()}
  def get_commit(owner, repo, commit_sha, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, commit_sha: commit_sha],
      call: {GitHub.Git, :get_commit},
      url: "/repos/#{owner}/#{repo}/git/commits/#{commit_sha}",
      method: :get,
      response: [
        {200, {GitHub.Git.Commit, :t}},
        {404, {GitHub.BasicError, :t}},
        {409, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a reference

  Returns a single reference from your Git database. The `:ref` in the URL must be formatted as `heads/<branch name>` for branches and `tags/<tag name>` for tags. If the `:ref` doesn't match an existing ref, a `404` is returned.

  **Note:** You need to explicitly [request a pull request](https://docs.github.com/rest/pulls/pulls#get-a-pull-request) to trigger a test merge commit, which checks the mergeability of pull requests. For more information, see "[Checking mergeability of pull requests](https://docs.github.com/rest/guides/getting-started-with-the-git-database-api#checking-mergeability-of-pull-requests)".

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/refs#get-a-reference)

  """
  @spec get_ref(String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.Git.Ref.t()} | {:error, GitHub.Error.t()}
  def get_ref(owner, repo, ref, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, ref: ref],
      call: {GitHub.Git, :get_ref},
      url: "/repos/#{owner}/#{repo}/git/ref/#{ref}",
      method: :get,
      response: [
        {200, {GitHub.Git.Ref, :t}},
        {404, {GitHub.BasicError, :t}},
        {409, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a tag

  **Signature verification object**

  The response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:

  | Name | Type | Description |
  | ---- | ---- | ----------- |
  | `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |
  | `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in table below. |
  | `signature` | `string` | The signature that was extracted from the commit. |
  | `payload` | `string` | The value that was signed. |

  These are the possible values for `reason` in the `verification` object:

  | Value | Description |
  | ----- | ----------- |
  | `expired_key` | The key that made the signature is expired. |
  | `not_signing_key` | The "signing" flag is not among the usage flags in the GPG key that made the signature. |
  | `gpgverify_error` | There was an error communicating with the signature verification service. |
  | `gpgverify_unavailable` | The signature verification service is currently unavailable. |
  | `unsigned` | The object does not include a signature. |
  | `unknown_signature_type` | A non-PGP signature was found in the commit. |
  | `no_user` | No user was associated with the `committer` email address in the commit. |
  | `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |
  | `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |
  | `unknown_key` | The key that made the signature has not been registered with any user's account. |
  | `malformed_signature` | There was an error parsing the signature. |
  | `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |
  | `valid` | None of the above errors applied, so the signature is considered to be verified. |

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/tags#get-a-tag)

  """
  @spec get_tag(String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.Git.Tag.t()} | {:error, GitHub.Error.t()}
  def get_tag(owner, repo, tag_sha, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, tag_sha: tag_sha],
      call: {GitHub.Git, :get_tag},
      url: "/repos/#{owner}/#{repo}/git/tags/#{tag_sha}",
      method: :get,
      response: [
        {200, {GitHub.Git.Tag, :t}},
        {404, {GitHub.BasicError, :t}},
        {409, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a tree

  Returns a single tree using the SHA1 value or ref name for that tree.

  If `truncated` is `true` in the response then the number of items in the `tree` array exceeded our maximum limit. If you need to fetch more items, use the non-recursive method of fetching trees, and fetch one sub-tree at a time.


  **Note**: The limit for the `tree` array is 100,000 entries with a maximum size of 7 MB when using the `recursive` parameter.

  ## Options

    * `recursive`: Setting this parameter to any value returns the objects or subtrees referenced by the tree specified in `:tree_sha`. For example, setting `recursive` to any of the following will enable returning objects or subtrees: `0`, `1`, `"true"`, and `"false"`. Omit this parameter to prevent recursively returning objects or subtrees.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/trees#get-a-tree)

  """
  @spec get_tree(String.t(), String.t(), String.t(), keyword) ::
          {:ok, GitHub.Git.Tree.t()} | {:error, GitHub.Error.t()}
  def get_tree(owner, repo, tree_sha, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:recursive])

    client.request(%{
      args: [owner: owner, repo: repo, tree_sha: tree_sha],
      call: {GitHub.Git, :get_tree},
      url: "/repos/#{owner}/#{repo}/git/trees/#{tree_sha}",
      method: :get,
      query: query,
      response: [
        {200, {GitHub.Git.Tree, :t}},
        {404, {GitHub.BasicError, :t}},
        {409, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List matching references

  Returns an array of references from your Git database that match the supplied name. The `:ref` in the URL must be formatted as `heads/<branch name>` for branches and `tags/<tag name>` for tags. If the `:ref` doesn't exist in the repository, but existing refs start with `:ref`, they will be returned as an array.

  When you use this endpoint without providing a `:ref`, it will return an array of all the references from your Git database, including notes and stashes if they exist on the server. Anything in the namespace is returned, not just `heads` and `tags`.

  **Note:** You need to explicitly [request a pull request](https://docs.github.com/rest/pulls/pulls#get-a-pull-request) to trigger a test merge commit, which checks the mergeability of pull requests. For more information, see "[Checking mergeability of pull requests](https://docs.github.com/rest/guides/getting-started-with-the-git-database-api#checking-mergeability-of-pull-requests)".

  If you request matching references for a branch named `feature` but the branch `feature` doesn't exist, the response can still include other matching head refs that start with the word `feature`, such as `featureA` and `featureB`.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/refs#list-matching-references)

  """
  @spec list_matching_refs(String.t(), String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Git.Ref.t()]} | {:error, GitHub.Error.t()}
  def list_matching_refs(owner, repo, ref, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, ref: ref],
      call: {GitHub.Git, :list_matching_refs},
      url: "/repos/#{owner}/#{repo}/git/matching-refs/#{ref}",
      method: :get,
      response: [{200, [{GitHub.Git.Ref, :t}]}, {409, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Update a reference

  Updates the provided reference to point to a new SHA. For more information, see "[Git References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)" in the Git documentation.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/git/refs#update-a-reference)

  """
  @spec update_ref(String.t(), String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Git.Ref.t()} | {:error, GitHub.Error.t()}
  def update_ref(owner, repo, ref, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, ref: ref, body: body],
      call: {GitHub.Git, :update_ref},
      url: "/repos/#{owner}/#{repo}/git/refs/#{ref}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Git.Ref, :t}},
        {409, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end
end
