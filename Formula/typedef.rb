class Typedef < Formula
  desc "Convert JSON to type definitions in multiple programming languages"
  homepage "https://github.com/exanubes/typedef"
  version "0.0.20"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm64?
      url "https://github.com/exanubes/typedef/releases/download/v0.0.20/typedef-cli-darwin-arm64.tar.gz"
      sha256 "4557d0b808620d18cb1c6850ef0a8577044a8bf5c5ba2704bbe08ea47d04e69f"
    end

    if Hardware::CPU.intel?
      url "https://github.com/exanubes/typedef/releases/download/v0.0.20/typedef-cli-darwin-amd64.tar.gz"
      sha256 "089262e6979766208ee7fd5f179c8a8642e0156e90d332641d87a258f4f75b9b"
    end
  end

  on_linux do
    if Hardware::CPU.arm64?
      url "https://github.com/exanubes/typedef/releases/download/v0.0.20/typedef-cli-linux-arm64.tar.gz"
      sha256 "965a673d2bcf1e8b7160d21036dd67165f25cd2383f077e1a6ea4779c7d85298"
    end

    if Hardware::CPU.intel?
      url "https://github.com/exanubes/typedef/releases/download/v0.0.20/typedef-cli-linux-amd64.tar.gz"
      sha256 "dd7a2b05b28e1fa09f49f83d432ae450b67d5a7bdf3891d00bea118aacd8cabb"
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
