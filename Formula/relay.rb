class Relay < Formula
  desc "Photo distribution tool for photographers and models"
  homepage "https://github.com/hidari/relay"
  version "0.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hidari/homebrew-tap/releases/download/v#{version}/relay-darwin-amd64-#{version}.tar.gz"
    sha256 "3af1efe7fae9a7703e19d8d3fd427696a54809179a85fba4a1dc09963e128c9f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hidari/homebrew-tap/releases/download/v#{version}/relay-darwin-arm64-#{version}.tar.gz"
    sha256 "0357ea28f3beb8ae1416ec9c6a461706183d22273e91b938ff6155ed883fbd73"
  end

  def install
    bin.install "relay"
  end

  test do
    system "#{bin}/relay", "--version"
  end
end
