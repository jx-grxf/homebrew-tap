class AgentPresence < Formula
  desc "Discord Rich Presence for Claude Code and Codex"
  homepage "https://github.com/jx-grxf/agent-presence"
  license "MIT"
  # No `version` stanza: Homebrew scans it from the URL, and `brew audit --strict`
  # rejects stating it twice.

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.1/agent-presence-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "8272d2ce8ff6490928f4d37575afc150135a82a7e87508f5a21649e8c593f27d"
    end
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.1/agent-presence-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "f09a015bbc8612217791489b57d83ec198bf3b30c80deb4afc8dd9192a3bc9e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.1/agent-presence-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "38e32b1429378fc0d3b2d5c897cc5cf3876dd354a26b9dc07a8c1e241c69d35d"
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
