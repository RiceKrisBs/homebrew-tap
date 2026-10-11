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

Installing by the full name, as above, also trusts the formula. To install by
its short name instead, trust it first
([Homebrew tap trust](https://docs.brew.sh/Tap-Trust)):

```sh
brew tap ricekrisbs/tap
brew trust --formula ricekrisbs/tap/goto-repo
brew install goto-repo
```

Or, in a `brew bundle` `Brewfile`:

```ruby
brew "ricekrisbs/tap/goto-repo", trusted: true
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
