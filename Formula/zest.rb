class Zest < Formula
  desc "Animate your shell prompt into view with a choice of effects"
  homepage "https://github.com/ackertyson/zest"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ackertyson/zest/releases/download/v#{version}/zest-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9a29960ca7a1c0b3ee5d9094af368203ec69eac2b22be1fc5d017c1e21c34a06"
    end
  end

  def install
    bin.install "zest"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zest --version")
  end
end
