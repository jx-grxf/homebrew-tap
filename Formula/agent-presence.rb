class AgentPresence < Formula
  desc "Discord Rich Presence for Claude Code and Codex"
  homepage "https://github.com/jx-grxf/agent-presence"
  license "MIT"
  # No `version` stanza: Homebrew scans it from the URL, and `brew audit --strict`
  # rejects stating it twice.

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.0/agent-presence-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "e5e8326865627843e85a39c38c617d9a6b49556c2a511a392385f655b05055be"
    end
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.0/agent-presence-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "823cca7d1396daffa233642a71d3154366fc1710197e64c51523e6192bf725d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.2.0/agent-presence-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46fb374f60f783dbf3d4811d02f542a418791a763e06f8b21ee5f6a55a001b33"
    end
  end

  def install
    bin.install "agent-presence"
  end

  def caveats
    <<~EOS
      Wire it into the agents you have installed:
        agent-presence install
        agent-presence doctor
    EOS
  end

  test do
    assert_match "agent-presence", shell_output("#{bin}/agent-presence --version")
  end
end
