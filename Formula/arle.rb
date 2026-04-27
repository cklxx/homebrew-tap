class Arle < Formula
  desc "Pure-Rust runtime for serving, local agents, training, and evaluation"
  homepage "https://github.com/cklxx/arle"
  url "https://github.com/cklxx/arle/releases/download/v0.1.3/arle-v0.1.3-macos-arm64.tar.gz"
  version "0.1.3"
  sha256 "c77867e6b88d16b28da5ef0e466f52cf04d195f4d4942b4b0b4b4b37aeb0025c"
  license "MIT"

  # macOS arm64 only. Linux users: see
  # https://github.com/cklxx/arle#quick-start (Docker, install.sh, or source).
  # The `mislav/bump-homebrew-formula-action` only knows how to bump one URL,
  # so a multi-platform formula goes stale on every release. Linux is rare
  # enough on this tool (CUDA driver gating, server deployments, Docker is
  # the canonical path) that the brew formula is intentionally Mac-only.
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "arle"
    bin.install "metal_serve" if File.exist?("metal_serve")
    # MLX's load_default_library searches paths colocated with the binary;
    # ship the metallib next to it so `metal_serve` can find Metal kernels
    # without falling back to the compile-time cmake build dir (which is
    # absent in distributed bottles).
    bin.install "mlx.metallib" if File.exist?("mlx.metallib")
  end

  test do
    assert_match "ARLE", shell_output("#{bin}/arle --help 2>&1")
  end
end
