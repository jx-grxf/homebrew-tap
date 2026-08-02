class AgentPresence < Formula
  desc "Discord Rich Presence for Claude Code and Codex"
  homepage "https://github.com/jx-grxf/agent-presence"
  license "MIT"
  # No `version` stanza: Homebrew scans it from the URL, and `brew audit --strict`
  # rejects stating it twice.

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.3/agent-presence-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "3a8a20e5123b44239293c6e71b5a0f80e364a817cce9a9ab42518449f9ec92ca"
    end
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.3/agent-presence-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "4ab0c3a496aaa250982e5fd5a62717dd46a8868f39748f6aca18fdf04da7fc35"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.3/agent-presence-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "327a8b6ebdc8712112446a08a3a9b070fa2f1ce62de29271f5e5970a588cc228"
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
