# cklxx/homebrew-tap

Homebrew tap for [ARLE](https://github.com/cklxx/arle) — a pure-Rust runtime
for serving, local agents, training, and evaluation.

## Install

```bash
brew install cklxx/tap/arle
```

That installs the `arle` CLI (and the `metal_serve` / `infer` binaries where
they are available for your platform). Verify with:

```bash
arle --doctor
```

## Supported platforms

| Platform | Backend | Binaries |
|---|---|---|
| macOS arm64 (Apple Silicon) | Metal | `arle`, `metal_serve` |
| Linux x86_64 | CUDA | `arle`, `infer`, `bench_serving` |

The CUDA-flavored Linux binary needs an NVIDIA driver + CUDA 12.x runtime on
the host. For CPU-only smoke or other backends, build from source — see the
[ARLE README](https://github.com/cklxx/arle#quick-start).

## Updating

The formula is bumped automatically by the
[`bump-homebrew-formula-action`](https://github.com/mislav/bump-homebrew-formula-action)
step in [ARLE's release workflow](https://github.com/cklxx/arle/blob/main/.github/workflows/release.yml)
on every `v*` tag push.
