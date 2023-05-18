# Contribution Guidelines

Hello there.
Thank you for your interest in contributing to this project.
With a wide variety of OpenAPI descriptions in the world, this project could use your assistance.

Reading and following the guidelines in this document is an act of kindness and respect for other contributors.
With your help, we can address issues, make changes, and work together efficiently.

## Ways to Contribute

There are many ways to contribute to this project:

* Individuals with experience in Elixir can help us to address observed and potential issues.
* Users of REST APIs with OpenAPI descriptions can try the generator and report any issues or recommendations for improvement they encounter.
* Users of the package can help to test new use-cases and patterns. Documentation improves everyone's experience.
* Anyone can assist in the triage of bugs, identifying root causes, and proposing solutions.

Please keep in mind the intended scope of this package: to provide a code generator that balances an ergonomic user experience with maintainability.
Assume that the OpenAPI description that serves as input to this library will change often, and manually changing the output is impractical.

## Ground Rules

All contributions to this project must align with the [code of conduct](CODE_OF_CONDUCT.md).
Beyond that, we ask:

* Please be kind. Maintaining this project is not paid work.
* Please create an issue before embarking on major refactors or new features.
* Let's make reasonable effort to support as many OpenAPI descriptions as possible.

## Security Issues

If you find a security-related issue with this project, please refrain from opening a public issue and instead [email the maintainer](mailto:public@aj-foster.com).

## Releases

For maintainers, the process of releasing this package to [Hex.pm](https://hex.pm/packages/oapi_generator) centers around git tags.
To make a new release:

1. Update the Changelog with a new header that has today's date and the new version.
  Include any missing notes from changes since the last release, and any additional upgrade instructions users may need.
2. Update the `@version` number in `mix.exs`.
  The form should be `X.Y.Z`, with optional suffixes, but no leading `v`.
3. Update the **Installation** instructions in `README.md` to have the newest non-suffixed version number.
4. Commit the above changes with a generic commit message, such as `Release X.Y.Z`.
5. Tag the commit as `X.Y.Z`, with optional suffixes, but no leading `v`.
6. Push the commits and tag (for example, `git push origin main --tags`).
7. Observe the GitHub Action titled **Release**.
  This action automatically publishes the package to Hex.pm.
