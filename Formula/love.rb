class Love < Formula
  desc "A lovely terminal heart animation (pronounced as 'trouble') 💜"
  homepage "https://github.com/hidari/tolove-ru"
  version "1.2.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hidari/tolove-ru/releases/download/v#{version}/love-darwin-amd64-#{version}.tar.gz"
    sha256 "39647030985c24923ccac4da7500a7b3e46a252e76a2abb6878ca426bb496288"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hidari/tolove-ru/releases/download/v#{version}/love-darwin-arm64-#{version}.tar.gz"
    sha256 "443d507592b1f34947253a4af61bf8b402e44aad743eadfcad878dbe1b06223d"
  end

  def install
    bin.install "love"
  end

  test do
    system "#{bin}/love", "--version"
  end
end