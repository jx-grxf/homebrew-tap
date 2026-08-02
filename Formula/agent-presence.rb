class AgentPresence < Formula
  desc "Discord Rich Presence for Claude Code and Codex"
  homepage "https://github.com/jx-grxf/agent-presence"
  license "MIT"
  # No `version` stanza: Homebrew scans it from the URL, and `brew audit --strict`
  # rejects stating it twice.

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.2/agent-presence-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "4835cef8954a2bf59353a11504919ec2ede3e4b2a1a122fac6c8fbb0b56d4147"
    end
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.2/agent-presence-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "0ccedc406197e0e97de5c78eb51d03cebd5de9035e22cb13517d2679a58aba65"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.2/agent-presence-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0bdec8e6cc7d13f567c05037933d6fe0db820cb105336160c1f2396c0f118ff1"
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
