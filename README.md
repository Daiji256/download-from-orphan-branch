# daiji256/download-from-orphan-branch

During a GitHub Actions workflow, this action downloads files from a specific branch (including orphan branches) into a directory.

A companion upload action is available at [daiji256/upload-to-orphan-branch](https://github.com/Daiji256/upload-to-orphan-branch). End-to-end usage examples are provided in [orphan-branch-upload-download-delete-examples](https://github.com/Daiji256/orphan-branch-upload-download-delete-examples).

## How it works

1. Create destination directory (`mkdir -p`).
2. Fetch branch: `git fetch origin <branch>`.
3. Work-tree checkout: `git --work-tree=<path> checkout origin/<branch> -- .`

## Inputs

| Input  | Default             | Description                   |
| ------ | ------------------- | ----------------------------- |
| branch | -                   | Branch name to download from. |
| path   | `$GITHUB_WORKSPACE` | Destination directory.        |

## Notes

- Branch must already exist remotely.
- No commits are created; only files materialized to the target directory.

## Example

```yaml
jobs:
  download:
    runs-on: ubuntu-latest
    permissions:
      contents: read

    steps:
      - uses: actions/checkout@v5
        with:
          fetch-depth: 0

      - uses: daiji256/download-from-orphan-branch@v0.1.1
        with:
          branch: artifacts-branch-name
          path: dir
```

## License

[MIT](LICENSE) © [Daiji256](https://github.com/Daiji256)
