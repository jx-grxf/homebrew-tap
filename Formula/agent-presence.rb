class AgentPresence < Formula
  desc "Discord Rich Presence for Claude Code and Codex"
  homepage "https://github.com/jx-grxf/agent-presence"
  license "MIT"
  # No `version` stanza: Homebrew scans it from the URL, and `brew audit --strict`
  # rejects stating it twice.

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.1/agent-presence-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "403f8a5adbae82ddf9cad9a4ed5ac152d90df27f7726df79712cefffa85f8c3e"
    end
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.1/agent-presence-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "b444843212f486e2e51e62857f361e46ee78059ff5e8cf045c7cfa7bd4028a2c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.1/agent-presence-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4ad7152dc6ff143633a82e5fbac699dbd8355733b7d19e4dc4c1a0783a7c41c"
    end
  end

  def install
    bin.install "agent-presence"
  end

  # Deliberately not a post_install hook: Homebrew sandboxes it and a formula must not
  # write outside the prefix, so wiring ~/.claude and ~/.codex is the user's call.
  def caveats
    <<~EOS
      One command left — it detects Claude Code and Codex and wires them up:

        agent-presence

      Then `agent-presence config` to choose what the card shows.
      Nothing identifying is shown by default.
    EOS
  end

  test do
    assert_match "agent-presence", shell_output("#{bin}/agent-presence --version")
  end
end
