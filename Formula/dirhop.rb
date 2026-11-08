class Dirhop < Formula
  desc "Fast fuzzy folder picker for your terminal"
  homepage "https://github.com/jx-grxf/dirhop"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/dirhop/releases/download/v0.3.0/dirhop-aarch64-apple-darwin.tar.gz"
      sha256 "48af7387348dd54d7df1c206e682a851542e119a322c9264051facc4a5ea1a4a"
    end
    on_intel do
      url "https://github.com/jx-grxf/dirhop/releases/download/v0.3.0/dirhop-x86_64-apple-darwin.tar.gz"
      sha256 "a37e50b51ce9112859f8ee8630efaa45a08f684f1fc6a311d594a9531d097522"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jx-grxf/dirhop/releases/download/v0.3.0/dirhop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fb644f0bdec57b2de56e958f375fa54a7eed1884c0ec82419d8425e8198da2b7"
    end
    on_intel do
      url "https://github.com/jx-grxf/dirhop/releases/download/v0.3.0/dirhop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0f062edc2e4c49bdf2d0e8ec50c5b5b4b6b8523abde5ebefe5a690068bfcb8a4"
    end
  end

  def install
    bin.install "dirhop"
  end

  def caveats
    <<~EOS
      Run `dirhop setup` once to pick a command name and a shortcut.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dirhop --version")
  end
end
