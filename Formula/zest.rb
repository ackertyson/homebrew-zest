class Zest < Formula
  desc "Animate your shell prompt into view with a choice of effects"
  homepage "https://github.com/ackertyson/zest"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ackertyson/zest/releases/download/v#{version}/zest-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cdcc01859f3026d029c1fe759e02fdbe38dc5655bd1b716a95cc305d3910edc2"
    end
  end

  def install
    bin.install "zest"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zest --version")
  end
end
