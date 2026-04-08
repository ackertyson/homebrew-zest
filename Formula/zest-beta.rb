class ZestBeta < Formula
  desc "Animate your shell prompt into view with a choice of effects (beta)"
  homepage "https://github.com/ackertyson/zest"
  version "0.1.4-beta.3"
  license "MIT"

  conflicts_with "zest", because: "both install a `zest` binary"

  on_macos do
    on_arm do
      url "https://github.com/ackertyson/zest/releases/download/v#{version}/zest-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ea6ac3f6be54992a48f1676d740257953baf124e1095f445293c2ef50c44772e"
    end
  end

  def install
    bin.install "zest"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zest --version")
  end
end
