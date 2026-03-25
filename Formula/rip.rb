class Rip < Formula
    desc "Handling cross-platform ZIP archives that just work everywhere"
    homepage "https://github.com/hidari/rip-zip"
    version "0.3.0"  # あなたのプロジェクトの現在のバージョン

    if OS.mac? && Hardware::CPU.intel?
      url "https://github.com/hidari/rip-zip/releases/download/v#{version}/rip-zip-x86_64-apple-darwin.zip"
      sha256 "869fc648a8a7aed24a76d771ea576160a4d0ffac17d2e94afab3259c5238c111" # バイナリのSHA256チェックサム
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/hidari/rip-zip/releases/download/v#{version}/rip-zip-aarch64-apple-darwin.zip"
      sha256 "513ed91ecfd584a0595364805d69334c9c534e17e7aa3df26894c807e922f5f8" # バイナリのSHA256チェックサム
    end

    def install
      bin.install "rip"
    end

    test do
      system "#{bin}/rip", "--version"
    end
  end
