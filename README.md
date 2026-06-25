# homebrew-whatsnext

Homebrew tap for [**What's Next**](https://whatsnext.venturevoid.com/) — the
macOS menu-bar meeting app.

## Install

```sh
brew install --cask venturevoid/whatsnext/whats-next
```

or:

```sh
brew tap venturevoid/whatsnext
brew install --cask whats-next
```

The app is signed and notarised by Apple, and keeps itself up to date via
its built-in updater (Sparkle), so you normally won't need `brew upgrade` —
new versions install themselves. To pull the latest DMG through Homebrew
anyway:

```sh
brew reinstall --cask whats-next
```

## Requirements

macOS 26 (Tahoe) or later · Apple Silicon & Intel.

## Uninstall

```sh
brew uninstall --cask whats-next        # remove the app
brew uninstall --zap --cask whats-next  # also remove its data
```

## Support

[support.whatsnext@venturevoid.com](mailto:support.whatsnext@venturevoid.com)
