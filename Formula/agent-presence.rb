class AgentPresence < Formula
  desc "Discord Rich Presence for Claude Code and Codex"
  homepage "https://github.com/jx-grxf/agent-presence"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.1.0/agent-presence-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "09023860c4ecf70337522510154a7cdc3ec9d3fef002a0931892fb3c401fe151"
    end
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.1.0/agent-presence-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "4049078884980af7c00966902c29a12881578fc337013d7d72cb8d0eb777eaea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jx-grxf/agent-presence/releases/download/v0.1.0/agent-presence-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78c8c6d31ace2a83e6486059666b65beac539faa51dfa1fffa2e7345c996813d"
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
