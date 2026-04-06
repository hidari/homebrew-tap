class Relay < Formula
  desc "Photo distribution tool for photographers and models"
  homepage "https://github.com/hidari/relay"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hidari/homebrew-tap/releases/download/v#{version}/relay-darwin-amd64-#{version}.tar.gz"
    sha256 "f8916d96686de49ba8d8cb1363671749fde99b21fdb5bded67df4f6a9ed5ca4f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hidari/homebrew-tap/releases/download/v#{version}/relay-darwin-arm64-#{version}.tar.gz"
    sha256 "30933079ad5a8bd696f9fc52ac41d630f04cb2c89c418a85bf1bbdcbb6e6903a"
  end

  def install
    bin.install "relay"
  end

  test do
    system "#{bin}/relay", "--version"
  end
end
