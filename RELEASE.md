# Release
To release a new version of ISSoundAdditions follow these steps:

## Prerequisites
- ISSoundAdditions doesn't enforce any specific branching strategy, but git-flow is generally recommended.
- If you made any changes to the documentation, you'll need [Jazzy](https://github.com/realm/jazzy).
- Ensure that the library builds and all tests are passing.

## Steps
- If you made any change that affects the documentation, run the following command in a Terminal in the ISSoundAdditions root folder:

```bash
jazzy \
  --module ISSoundAdditions \
  --swift-build-tool spm \
  --build-tool-arguments -Xswiftc,-swift-version,-Xswiftc,5 \
  --clean
``` 

- Commit all your changes and use your branch strategy to push the changes to the `master` branch.
- Publish a new release for the new version (eg. `v2.0.0`) using the GitHub Releases section. Make sure to document the changes using the following categories: "Added", "Improved" and "Fixed". *When referencing bugs, make sure to include a link to the GitHub issue.*
