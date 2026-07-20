class AgentPresence < Formula
  desc "Discord Rich Presence for Claude Code and Codex"
  homepage "https://github.com/jx-grxf/agent-presence"
  license "MIT"
  # No `version` stanza: Homebrew scans it from the URL, and `brew audit --strict`
  # rejects stating it twice.

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.1.1/agent-presence-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "e9948f5485b9d10a411403ef62597b017a133059307fdc59400b205eb2165a33"
    end
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.1.1/agent-presence-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "fc73b57e5a3e8ffb94cbd070b1c20b002800075a94fd008777472dd5af3ddf90"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.1.1/agent-presence-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "97fb59320c8eadcbf139b22fef35c30cfc5c87f3173e43abcf871a859f60cbd6"
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
