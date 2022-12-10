# Config for testing purposes only
import Config

config :open_api,
  default: [
    base_location: "example/lib/",
    base_module: Example,
    group: [
      Actions,
      Actions.Runner,
      Actions.Workflow,
      AdvancedSecurity,
      Branch,
      Check,
      CodeOfConduct,
      CodeScanning,
      Codespace,
      Commit,
      Content,
      Deployment,
      Gist,
      Hook,
      Installation,
      Issue,
      License,
      Marketplace,
      Organization,
      Project,
      ProtectedBranch,
      PullRequest,
      Release,
      Repository,
      Runner,
      SCIM,
      Team,
      Timeline,
      User,
      Webhook,
      Webhook.Config
    ],
    # ignore: [
    #   "repository"
    # ],
    merge: [
      {"FullRepository", "Repository"}
    ],
    rename: [
      {~r/^Codespaces/, "Codespace"},
      {~r/Oidc/, "OIDC"},
      {~r/^Runner/, "Actions.Runner"},
      {~r/^Scim/, "SCIM"},
      {~r/^Simple(.*)/, "\\1.Simple"},
      {~r/^Ssh/, "SSH"},
      {~r/^Workflow/, "Actions.Workflow"}
    ],
    schema_location: "schemas/"
  ]
