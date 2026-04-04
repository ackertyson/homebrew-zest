class ZestBeta < Formula
  desc "Animate your shell prompt into view with a choice of effects (beta)"
  homepage "https://github.com/ackertyson/zest"
  version "0.1.4-beta.0"
  license "MIT"

  conflicts_with "zest", because: "both install a `zest` binary"

  on_macos do
    on_arm do
      url "https://github.com/ackertyson/zest/releases/download/v#{version}/zest-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8dbb21dbcdb9fac24ce733fa85c5d5dc09c0129bbff33672bae881e09bbb4857"
    end
  end

  def install
    bin.install "zest"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zest --version")
  end
end
