# Config for testing purposes only
import Config

config :oapi_generator,
  default: [
    base_location: "example/lib/",
    base_module: Example,
    schema_location: "schemas/",
    schema_use: MyModule,
    naming: [
      group: [
        Actions,
        Actions.Runner,
        Actions.Workflow,
        AdvancedSecurity,
        Alert,
        Branch,
        Check,
        CodeOfConduct,
        CodeScanning,
        Codespace,
        Commit,
        Content,
        Dependabot,
        Dependabot.Alert,
        Deployment,
        Gist,
        Git,
        Hook,
        Installation,
        Interaction,
        Interaction.Limit,
        Issue,
        License,
        Marketplace,
        Organization,
        Page,
        Pages,
        Project,
        ProtectedBranch,
        PullRequest,
        RateLimit,
        Reaction,
        Release,
        Repository,
        Runner,
        SCIM,
        SecretScanning,
        Team,
        Timeline,
        User,
        Webhook,
        Webhook.Config
      ],
      merge: [
        {"FullRepository", "Repository"},
        {~r/^Simple/, ""},
        {~r/Simple$/, ""},
        {"PrivateUser", "User"},
        {"PublicUser", "User"}
      ],
      rename: [
        {~r/^Codespaces/, "Codespace"},
        {~r/Oidc/, "OIDC"},
        {~r/^Runner/, "Actions.Runner"},
        {~r/^Scim/, "SCIM"},
        {~r/^Ssh/, "SSH"},
        {~r/^Workflow/, "Actions.Workflow"}
      ]
    ],
    output: [
      base_module: Example,
      extra_fields: [__info__: :map],
      location: "example/lib",
      request_type: :inline,
      response_type: :inline,
      schema_subdirectory: "schemas",
      schema_use: MyModule,
      types: [
        error: {GitHub.Error, :t}
      ]
    ]
  ]
