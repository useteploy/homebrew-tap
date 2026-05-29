# typed: false
# frozen_string_literal: true

# Maintained on the canonical tap (tyler/homebrew-tap, mirrored to GitHub).
# NOTE: goreleaser auto-pushes the formula to the GitHub mirror, but the
# Forgejo->GitHub force-mirror overwrites it, so version bumps are applied
# here by hand until the release/tap automation is reconciled.
class Teploy < Formula
  desc "Zero-downtime Docker deploys to any server via SSH"
  homepage "https://github.com/useteploy/teploy-cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/useteploy/teploy-cli/releases/download/v0.1.5/teploy_darwin_amd64.tar.gz"
      sha256 "97282d6dcd16c9d107d6baf968193260c899bcfa57d64eddda512481fca48dbb"

      define_method(:install) do
        bin.install "teploy"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/useteploy/teploy-cli/releases/download/v0.1.5/teploy_darwin_arm64.tar.gz"
      sha256 "c172035aa370eda10e92f20979da9181ddfcbfa56db809125f7a578737b7052c"

      define_method(:install) do
        bin.install "teploy"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/useteploy/teploy-cli/releases/download/v0.1.5/teploy_linux_amd64.tar.gz"
      sha256 "c5d37b3e3dc9448205ca6edbf31066cc56eac72425ccecd92b5aacb421a28277"
      define_method(:install) do
        bin.install "teploy"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/useteploy/teploy-cli/releases/download/v0.1.5/teploy_linux_arm64.tar.gz"
      sha256 "6a0681101ac1ed8da79d14dcf2c134ba21d0b939f811075e9a0a99ba2c8dfc5c"
      define_method(:install) do
        bin.install "teploy"
      end
    end
  end
end
