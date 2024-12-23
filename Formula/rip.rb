class Rip < Formula
    desc "Handling cross-platform ZIP archives that just work everywhere"
    homepage "https://github.com/hidari/rip-zip"
    version "0.1.2"  # あなたのプロジェクトの現在のバージョン

    if OS.mac? && Hardware::CPU.intel?
      url "https://github.com/hidari/rip-zip/releases/download/v#{version}/rip-zip-x86_64-apple-darwin.tar.gz"
      sha256 "8a9a867b65e08894d38776daf255cd798413b52844f686475e4c8d383bdb4a2c" # バイナリのSHA256チェックサム
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/hidari/rip-zip/releases/download/v#{version}/rip-zip-aarch64-apple-darwin.tar.gz"
      sha256 "f7a79b8bb8f85adaf95f51b656aa7a51ef513f85fd8988519de027930c292ac2" # バイナリのSHA256チェックサム
    end

    def install
      bin.install "rip"
    end

    test do
      system "#{bin}/rip", "--version"
    end
  end
