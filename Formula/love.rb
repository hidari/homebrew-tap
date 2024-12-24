class Love < Formula
  desc "A lovely terminal heart animation (pronounced as 'trouble') 💜"
  homepage "https://github.com/hidari/tolove-ru"
  version "1.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hidari/tolove-ru/releases/download/v#{version}/love-darwin-amd64-#{version}.tar.gz"
    sha256 "7e1519ed6fd4aa7fe11e53521d2483d3841950bbfeb9d9285cb016a3185e8b41"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hidari/tolove-ru/releases/download/v#{version}/love-darwin-arm64-#{version}.tar.gz"
    sha256 "c7845ea63d96eb7c24a47473451f88e67b29b88652b4d601605614fa72c7ac42"
  end

  def install
    bin.install "love"
  end

  test do
    system "#{bin}/love", "--version"
  end
end