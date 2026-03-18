class Zest < Formula
  desc "Animate your shell prompt into view with a choice of effects"
  homepage "https://github.com/ackertyson/zest"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ackertyson/zest/releases/download/v#{version}/zest-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "de0e8688a570cbad532c63e77f5fc328faddb52d45f80694ffc8009713171f4d"
    end
  end

  def install
    bin.install "zest"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/zest --help")
  end
end
