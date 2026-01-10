class Typedef < Formula
  desc "Convert JSON to type definitions in multiple programming languages"
  homepage "https://github.com/exanubes/typedef"
  version "0.0.21"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm64?
      url "https://github.com/exanubes/typedef/releases/download/v0.0.21/typedef-cli-darwin-arm64.tar.gz"
      sha256 "a31661f4d3f4e841e3ff708cddbd53e72cf2ce739cccec55da240307663c314c"
    end

    if Hardware::CPU.intel?
      url "https://github.com/exanubes/typedef/releases/download/v0.0.21/typedef-cli-darwin-amd64.tar.gz"
      sha256 "09765f224e5e9147d83dec2ead6de4b3c66c2cb4486ca054fa6d78e5bca1d532"
    end
  end

  on_linux do
    if Hardware::CPU.arm64?
      url "https://github.com/exanubes/typedef/releases/download/v0.0.21/typedef-cli-linux-arm64.tar.gz"
      sha256 "6a6d124f40a0582577afba1ea7cf7cc173d87bd9ffd1e06104b8978c157cd18a"
    end

    if Hardware::CPU.intel?
      url "https://github.com/exanubes/typedef/releases/download/v0.0.21/typedef-cli-linux-amd64.tar.gz"
      sha256 "d2919d9d7e5a5bf3768894c821f2e60f24f5d27524f085350ede968949fc3bd0"
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
