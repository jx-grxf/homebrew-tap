class Dirhop < Formula
  desc "Fast fuzzy folder picker for your terminal"
  homepage "https://github.com/jx-grxf/dirhop"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/dirhop/releases/download/v0.3.1/dirhop-aarch64-apple-darwin.tar.gz"
      sha256 "0035b127efa790ecc571bebe2cdb4d6d5beba14a0971945281234c447ca233a8"
    end
    on_intel do
      url "https://github.com/jx-grxf/dirhop/releases/download/v0.3.1/dirhop-x86_64-apple-darwin.tar.gz"
      sha256 "0db0988ab1b172e119d888636661b09a14590b3f2958572f4e8c8a1db06e0b83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jx-grxf/dirhop/releases/download/v0.3.1/dirhop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e95d512f7cdf30af0ac141850a0f217a03bccb0a37d2e3296d4bb2ef145dcc72"
    end
    on_intel do
      url "https://github.com/jx-grxf/dirhop/releases/download/v0.3.1/dirhop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "10d452e8adeae09d038e8ccd20289baafaf79ce89bd1c81de04668d39860e006"
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
