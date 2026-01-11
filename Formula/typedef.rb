class Typedef < Formula
  desc "Convert JSON to type definitions in multiple programming languages"
  homepage "https://github.com/exanubes/typedef"
  version "0.0.22"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm64?
      url "https://github.com/exanubes/typedef/releases/download/v0.0.22/typedef-cli-darwin-arm64.tar.gz"
      sha256 "bdd57920fdebf60dd95ac21f7790ea9ab34a27862ffe49d79e1c73384a11125b"
    end

    if Hardware::CPU.intel?
      url "https://github.com/exanubes/typedef/releases/download/v0.0.22/typedef-cli-darwin-amd64.tar.gz"
      sha256 "0fddeded2aa6c5ee9cd7c5626f9f384e3d1b99271850a39b97bbea6c28d2942e"
    end
  end

  on_linux do
    if Hardware::CPU.arm64?
      url "https://github.com/exanubes/typedef/releases/download/v0.0.22/typedef-cli-linux-arm64.tar.gz"
      sha256 "cbbe64a0ea59a52a7d78c2d87ad24e6e680fd68b858c5b687c304e657dad08d9"
    end

    if Hardware::CPU.intel?
      url "https://github.com/exanubes/typedef/releases/download/v0.0.22/typedef-cli-linux-amd64.tar.gz"
      sha256 "49c32713b8573ef20f0f986dd7e54a6229994bcece0600d7440f59081f88f41a"
    end
  end

  def install
    bin.install "typedef-cli" => "typedef"
  end

  test do
    output = shell_output("#{bin}/typedef --format go --input '{\"test\": 1}' --target cli")
    assert_match(/type\s+Root\s+struct/, output)
  end
end
