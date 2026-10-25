# homebrew-tap

Homebrew formulae and casks for [jx-grxf](https://github.com/jx-grxf) tools.

```bash
brew tap jx-grxf/tap
brew install jx-grxf/tap/agent-presence
brew trust --cask jx-grxf/tap/dysonbar   # casks from third-party taps need this once
brew install --cask jx-grxf/tap/dysonbar
```

| Formula | What |
|---|---|
| [`agent-presence`](Formula/agent-presence.rb) | [Discord Rich Presence for Claude Code and Codex](https://github.com/jx-grxf/agent-presence) |
| [`dysonbar`](Casks/dysonbar.rb) (cask) | [Menu bar app for Dyson air purifiers](https://github.com/jx-grxf/DysonBar) |

Formulae here are generated on release and pushed automatically. Edit them in the source
repository's `packaging/` templates, not here — a hand-edit is overwritten by the next
release. The `dysonbar` cask is updated by hand from `Casks/dysonbar.rb` in the DysonBar repository.
