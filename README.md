# RiceKrisBs Tap

Homebrew formulae by RiceKrisBs.

| Formula | Description |
| --- | --- |
| [`goto-repo`](https://github.com/RiceKrisBs/goto) | `gt`: jump to any git repo under `~/src` by its directory name |

## Install goto

```sh
brew install ricekrisbs/tap/goto-repo
```

Then add this to your `~/.zshrc` and open a new shell:

```zsh
source "$HOMEBREW_PREFIX/share/goto/goto.zsh"
```

See the [goto README](https://github.com/RiceKrisBs/goto#readme) for usage.

## Other ways to install

`brew tap ricekrisbs/tap` and then `brew install goto-repo`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "ricekrisbs/tap"
brew "goto-repo"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
