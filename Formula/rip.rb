class Rip < Formula
    desc "Handling cross-platform ZIP archives that just work everywhere"
    homepage "https://github.com/hidari/rip-zip"
    version "0.3.0"  # あなたのプロジェクトの現在のバージョン

    if OS.mac? && Hardware::CPU.intel?
      url "https://github.com/hidari/rip-zip/releases/download/v#{version}/rip-zip-x86_64-apple-darwin.zip"
      sha256 "952862ba531ee5fb2f6cab93da98aeafd6ecb73820915051e5ef6dbd7a6281e9" # バイナリのSHA256チェックサム
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/hidari/rip-zip/releases/download/v#{version}/rip-zip-aarch64-apple-darwin.zip"
      sha256 "9f48d0b69805260a3015df1b87ba19e8bdaf3d5ecd12e55f0772d2199532baba" # バイナリのSHA256チェックサム
    end

    def install
      bin.install "rip"
    end

    test do
      system "#{bin}/rip", "--version"
    end
  end
