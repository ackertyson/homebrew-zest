class Zest < Formula
  desc "Animate your shell prompt into view with a choice of effects"
  homepage "https://github.com/ackertyson/zest"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ackertyson/zest/releases/download/v#{version}/zest-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e3d0798cfd59a53088d4cfb04b656428b25e6362290074f858e4617ec187decf"
    end
  end

  def install
    bin.install "zest"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zest --version")
  end
end
