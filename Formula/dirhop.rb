class Dirhop < Formula
  desc "Fast fuzzy folder picker for your terminal"
  homepage "https://github.com/jx-grxf/dirhop"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jx-grxf/dirhop/releases/download/v0.2.0/dirhop-aarch64-apple-darwin.tar.gz"
      sha256 "e5bf5a93d5e4c9b67334666af3237f7a1996c654a01ee446604e50d78dba5846"
    end
    on_intel do
      url "https://github.com/jx-grxf/dirhop/releases/download/v0.2.0/dirhop-x86_64-apple-darwin.tar.gz"
      sha256 "596bed8ebc74a17b0c303dc75f30782c98b74b23f5605e49f3de3f3e8be6dd52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jx-grxf/dirhop/releases/download/v0.2.0/dirhop-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ed197d8e387fd872028ee9e0c461fd09c86accdba74037a682da573e00a94692"
    end
    on_intel do
      url "https://github.com/jx-grxf/dirhop/releases/download/v0.2.0/dirhop-x86_64-unknown-linux-musl.tar.gz"
      sha256 "225662f008e49473a781fdfdc2df64e0ee98517fded0e2e2275b71d5eaec0cd6"
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
