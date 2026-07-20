class AgentPresence < Formula
  desc "Discord Rich Presence for Claude Code and Codex"
  homepage "https://github.com/jx-grxf/agent-presence"
  license "MIT"
  # No `version` stanza: Homebrew scans it from the URL, and `brew audit --strict`
  # rejects stating it twice.

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.1.0/agent-presence-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "b8ea53ada428f3e1a805d516f28ca428daddec9b10b2a5b09c91742bb7b6f0db"
    end
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.1.0/agent-presence-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "76fa9a50e92d1166de800a1cf22bfd27bcd6d271ff90c764216bafc6d951de0a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.1.0/agent-presence-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8dd4da8b9d6efa37c16485f36e310e9800157f293bc60ec3e9543df7e5973bcd"
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
