class Relay < Formula
  desc "Photo distribution tool for photographers and models"
  homepage "https://github.com/hidari/relay"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hidari/relay/releases/download/v#{version}/relay-darwin-amd64-#{version}.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hidari/relay/releases/download/v#{version}/relay-darwin-arm64-#{version}.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  def install
    bin.install "relay"
  end

  test do
    system "#{bin}/relay", "--version"
  end
end
