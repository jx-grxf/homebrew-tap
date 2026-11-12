class AgentPresence < Formula
  desc "Discord Rich Presence for Claude Code and Codex"
  homepage "https://github.com/jx-grxf/agent-presence"
  license "MIT"
  # No `version` stanza: Homebrew scans it from the URL, and `brew audit --strict`
  # rejects stating it twice.

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.3.1/agent-presence-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "65fb0bd75c0543a46845bd0c345bd141c015ce36af04776e832cc13ee6be608f"
    end
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.3.1/agent-presence-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "9c1f7855fa54da1a0735f859f5469a0de35609fdf2344ae9f2e524ebddfe6ab3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.3.1/agent-presence-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "130f561537c7a3d4b0a8265f398458967babf38b540b8e8adddb50964a960604"
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
