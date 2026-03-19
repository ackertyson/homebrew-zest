class Zest < Formula
  desc "Animate your shell prompt into view with a choice of effects"
  homepage "https://github.com/ackertyson/zest"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ackertyson/zest/releases/download/v#{version}/zest-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7caef26ae97b97d133f4240d85bf8ca4666dfb885373ef8a0fbf064a50efb6b6"
    end
  end

  def install
    bin.install "zest"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zest --version")
  end
end
