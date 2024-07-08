defmodule SearchMatchAPISearching do
  @moduledoc """
  Provides API endpoints related to search match api searching
  """

  @default_client Client

  @doc """
  Search through parsed job descriptions

  Searches through parsed job descriptions. You can search with custom criterias or a resume.

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.

  """
  @spec create_job_description_search(JobDescriptionSearchParameters.t(), keyword) ::
          {:ok, JobDescriptionSearch.t()} | {:error, RequestError.t()}
  def create_job_description_search(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [body: body],
      call: {SearchMatchAPISearching, :create_job_description_search},
      url: "/v3/job_description_search",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {JobDescriptionSearchParameters, :t}}],
      response: [
        {201, {JobDescriptionSearch, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Search through parsed resumes

  Searches through parsed resumes. Users have 3 options to create a search:<br /><br /> 1.	Match to a job description - a parsed job description is used to find candidates that suit it<br /> 2.	Match to a resume - a parsed resume is used to find other candidates that have similar attributes<br /> 3.	Search using custom criteria<br /><br /> Users should only populate 1 of jobDescription, resume or the custom criteria.

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.

  """
  @spec create_resume_search(ResumeSearchParameters.t(), keyword) ::
          {:ok, ResumeSearch.t()} | {:error, RequestError.t()}
  def create_resume_search(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [body: body],
      call: {SearchMatchAPISearching, :create_resume_search},
      url: "/v3/resume_search",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {ResumeSearchParameters, :t}}],
      response: [
        {201, {ResumeSearch, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get search result of specific job description

  This contains more detailed information about the matching score of the search criteria, or which search criteria is missing in this job description.
  The `identifier` is the unique ID returned via the [/job_description_search](#post-/job_description_search) endpoint.
  """
  @spec get_job_description_search_detail(String.t(), JobDescriptionSearchParameters.t(), keyword) ::
          {:ok, JobDescriptionSearchDetail.t()} | {:error, RequestError.t()}
  def get_job_description_search_detail(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {SearchMatchAPISearching, :get_job_description_search_detail},
      url: "/v3/job_description_search/details/#{identifier}",
      body: body,
      method: :post,
      request: [{"application/json", {JobDescriptionSearchParameters, :t}}],
      response: [
        {200, {JobDescriptionSearchDetail, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get search result of specific resume

  This contains more detailed information about the matching score of the search criteria, or which search criteria is missing in this resume.
  The `identifier` is the unique ID returned via the [/resume_search](#post-/resume_search) endpoint.
  """
  @spec get_resume_search_detail(String.t(), ResumeSearchParameters.t(), keyword) ::
          {:ok, ResumeSearchDetail.t()} | {:error, RequestError.t()}
  def get_resume_search_detail(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {SearchMatchAPISearching, :get_resume_search_detail},
      url: "/v3/resume_search/details/#{identifier}",
      body: body,
      method: :post,
      request: [{"application/json", {ResumeSearchParameters, :t}}],
      response: [
        {200, {ResumeSearchDetail, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Match a single resume and job description

  Get the matching score between a resume and a job description. The score ranges between 0 and 1, with 0 being not a match at all, and 1 being perfect match.<br/> Note, this score will not directly match the score returned from POST [/resume_search/details/{identifier}](#post-/resume_search/details/-identifier-).

  ## Options

    * `resume`: Identify the resume to match.
    * `job_description`: Identify the job description to match.
    * `index`: Optionally, specify an index to search in. If not specified, will search in all indexes.
    * `search_expression`: Add keywords to the search criteria.
    * `job_titles_weight`: How important is this criteria to the matching score, range from 0 to 1.
    * `years_experience_weight`: How important is this criteria to the matching score, range from 0 to 1.
    * `locations_weight`: How important is this criteria to the matching score, range from 0 to 1.
    * `languages_weight`: How important is this criteria to the matching score, range from 0 to 1.
    * `skills_weight`: How important is this criteria to the matching score, range from 0 to 1.
    * `education_weight`: How important is this criteria to the matching score, range from 0 to 1.
    * `search_expression_weight`: How important is this criteria to the matching score, range from 0 to 1.
    * `soc_codes_weight`: How important is this criteria to the matching score, range from 0 to 1.
    * `management_level_weight`: How important is this criteria to the matching score, range from 0 to 1.

  """
  @spec get_resume_search_match(keyword) ::
          {:ok, ResumeSearchMatch.t()} | {:error, RequestError.t()}
  def get_resume_search_match(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :education_weight,
        :index,
        :job_description,
        :job_titles_weight,
        :languages_weight,
        :locations_weight,
        :management_level_weight,
        :resume,
        :search_expression,
        :search_expression_weight,
        :skills_weight,
        :soc_codes_weight,
        :years_experience_weight
      ])

    client.request(%{
      args: [],
      call: {SearchMatchAPISearching, :get_resume_search_match},
      url: "/v3/resume_search/match",
      method: :get,
      query: query,
      response: [
        {200, {ResumeSearchMatch, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get job title suggestions based on provided job title(s)

  Provided one or more job titles, get related suggestions for your search.

  ## Options

    * `job_titles`: Job title to query suggestions for

  """
  @spec get_resume_search_suggestion_job_title(keyword) ::
          {:ok, [String.t()]} | {:error, RequestError.t()}
  def get_resume_search_suggestion_job_title(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:job_titles])

    client.request(%{
      args: [],
      call: {SearchMatchAPISearching, :get_resume_search_suggestion_job_title},
      url: "/v3/resume_search/suggestion_job_title",
      method: :get,
      query: query,
      response: [
        {200, [string: :generic]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get skill suggestions based on provided skill(s)

  Provided one or more skills, get related suggestions for your search.

  ## Options

    * `skills`: Skill to query suggestions for

  """
  @spec get_resume_search_suggestion_skill(keyword) ::
          {:ok, [String.t()]} | {:error, RequestError.t()}
  def get_resume_search_suggestion_skill(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:skills])

    client.request(%{
      args: [],
      call: {SearchMatchAPISearching, :get_resume_search_suggestion_skill},
      url: "/v3/resume_search/suggestion_skill",
      method: :get,
      query: query,
      response: [
        {200, [string: :generic]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  List occupation groups

  Returns the list of searchable occupation groups.
  """
  @spec list_occupation_groups(keyword) ::
          {:ok, [OccupationGroup.t()]} | {:error, RequestError.t()}
  def list_occupation_groups(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SearchMatchAPISearching, :list_occupation_groups},
      url: "/v3/occupation_groups",
      method: :get,
      response: [
        {200, [{OccupationGroup, :t}]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end
end
