# Git conventions

## Commits

### Description

**All commits should be formatted like this :**

```text
<type>(<optional scope>): <subject>

<optional body>

<optional footer>
```

| Type       | Description                                    |
|------------|------------------------------------------------|
| [feat]     | New feature for the user                       |
| [build]    | Develop architectural features                 |
| [chore]    | Update grunt tasks                             |
| [refactor] | Restructure code, rename fields                |
| [test]     | Add/edit some tests                            |
| [fix]      | Repair a bug, correct a mistake                |
| [loc]      | Change localization configuration/translations |
| [pub]      | Edit pubspec/build/analysis files.             |
| [lint]     | Fix linter problems                            |
| [clean]    | Remove dead code, make it more readable        |
| [readme]   | Apply changes to the README file               |
| [doc]      | Update documentation                           |

- `<optional scope>` describes the feature or the file that is edited. This field is optional.
- `<subject>` gives a short description about the edited code in the last commit.
- `<optional body>` provides a longer description to describe the commit more precisely. This field is optional.
- `<optional footer>` specifies the ticket in progress, or some references, if they are needed. This field is optional.

### Notes

- If the work is in progress, you should prefix the commit message by `[WIP]`.
- All commit messages should be written in the present tense
- If there is a breaking change, add `!` after `<type>`, before `:`

### Examples of commit message

```text
feat: change color button 'send'
build: import package flutter_riverpod in pubspec
refactor!: new library for navigation (go_router)
chore!: update version go_router
```

### Sources

This syntax has been inspired by the following contents :

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [Gist by @joshbuchea](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716)

## Versioning with tags

The tags should follow the following rules :

- The Major should only be incremented if the product faces considerable changes, and the sprint number is reset to 1. It normally starts at 1
- The Minor is the number of the sprint
- The Build Revision can be incremented for any fixes delivered to the client

For example, if this is the third revision of the sprint 4, the tag should be 1.4.3 :
`git tag -a 1.4.3 9feeb02 -m "Fixed border yellow button"`

If we create a tag "1.2.0" somewhere, every builds' versionName will be "1.2.0" suffixed with commit hash, and versionCode equal to the list of tags on this git repository.
If the current commit is the one pointed by the last tag, then the commit hash is omitted.
