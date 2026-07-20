class AgentPresence < Formula
  desc "Discord Rich Presence for Claude Code and Codex"
  homepage "https://github.com/jx-grxf/agent-presence"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.1.0/agent-presence-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "fa112726f02b8066b956bd2dc1ae80b64c102c68d593a0716601677ea6a8d9da"
    end
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.1.0/agent-presence-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "85c0064353cbb7cf0c386e90c74d41c79a1bd525e8bf41eabe1343ce82f9c1cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.1.0/agent-presence-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8422d2d8180848e602f948dff27ff88701a916d6e7ef36976357a83b494291c6"
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
