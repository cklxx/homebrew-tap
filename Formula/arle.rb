class Arle < Formula
  desc "Pure-Rust runtime for serving, local agents, training, and evaluation"
  homepage "https://github.com/cklxx/arle"
  url "https://github.com/cklxx/arle/releases/download/v0.1.5/arle-v0.1.5-macos-arm64.tar.gz"
  version "0.1.5"
  sha256 "45d17c2fe7cc16f1a565b44392367ea8e3ec7b84c2b7544acfdc45d3d203f587"
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
