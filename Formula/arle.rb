class Arle < Formula
  desc "Pure-Rust runtime for serving, local agents, training, and evaluation"
  homepage "https://github.com/cklxx/arle"
  version "0.1.1"
  license "MIT"

  # macOS arm64 only. Linux users: see
  # https://github.com/cklxx/arle#quick-start (Docker, install.sh, or source).
  # The `mislav/bump-homebrew-formula-action` only knows how to bump one URL,
  # so a multi-platform formula goes stale on every release. Linux is rare
  # enough on this tool (CUDA driver gating, server deployments, Docker is
  # the canonical path) that the brew formula is intentionally Mac-only.
  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/cklxx/arle/releases/download/v0.1.1/arle-v0.1.1-macos-arm64.tar.gz"
  sha256 "a9097df0b18ec3ccd6b55a529d158032b18d0bf79e1fe0c8c7cf21f82b4daefe"

  def install
    bin.install "arle"
    bin.install "metal_serve" if File.exist?("metal_serve")
  end

  test do
    assert_match "ARLE", shell_output("#{bin}/arle --help 2>&1", 0)
  end
end
