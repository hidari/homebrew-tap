class Rip < Formula
    desc "Handling cross-platform ZIP archives that just work everywhere"
    homepage "https://github.com/hidari/rip-zip"
    version "0.2.0"  # あなたのプロジェクトの現在のバージョン

    if OS.mac? && Hardware::CPU.intel?
      url "https://github.com/hidari/rip-zip/releases/download/v#{version}/rip-zip-x86_64-apple-darwin.zip"
      sha256 "21c36d0f607c130f70ebfce0baf6dc14bea63a955ab3f7319523e1fe267530e4" # バイナリのSHA256チェックサム
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/hidari/rip-zip/releases/download/v#{version}/rip-zip-aarch64-apple-darwin.zip"
      sha256 "d0ca74e89f0f026d523016ff662099f41a52ff30b439d7c01d5268efc963ecb3" # バイナリのSHA256チェックサム
    end

    def install
      bin.install "rip"
    end

    test do
      system "#{bin}/rip", "--version"
    end
  end
