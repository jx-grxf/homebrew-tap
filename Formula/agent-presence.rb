class AgentPresence < Formula
  desc "Discord Rich Presence for Claude Code and Codex"
  homepage "https://github.com/jx-grxf/agent-presence"
  license "MIT"
  # No `version` stanza: Homebrew scans it from the URL, and `brew audit --strict`
  # rejects stating it twice.

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.3.0/agent-presence-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "dd8dea61a04154eb2be645ffff5b9eb0312df593faba5845ac958d39ba00c393"
    end
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.3.0/agent-presence-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "277169c399ceccd8f539ab866b3378daee16a175ea7d2377ab08bcb4fce4461e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.3.0/agent-presence-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "161ace6d4f0f4d4b42e22a1d8f001fdc94946daf4b481888ed711032bf7bea05"
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
