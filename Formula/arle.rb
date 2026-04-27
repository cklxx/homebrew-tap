class Arle < Formula
  desc "Pure-Rust runtime for serving, local agents, training, and evaluation"
  homepage "https://github.com/cklxx/arle"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cklxx/arle/releases/download/v0.1.0/arle-v0.1.0-macos-arm64.tar.gz"
      sha256 "e489966c52f1a954e4058d1193fc85bf92ce979895578024111fbdbaad510945"

      def install
        bin.install "arle"
        bin.install "metal_serve" if File.exist?("metal_serve")
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cklxx/arle/releases/download/v0.1.0/arle-v0.1.0-linux-x86_64.tar.gz"
      sha256 "0329aea16641d9e8b74658f8cf0958f714173df9582a52dc708cf7300b8f4d99"

      def install
        bin.install "arle"
        bin.install "infer" if File.exist?("infer")
        bin.install "bench_serving" if File.exist?("bench_serving")
      end
    end
  end

  test do
    assert_match "ARLE", shell_output("#{bin}/arle --help 2>&1", 0)
  end
end
