class TeployTrmnl < Formula
  desc "Terminal IDE — preconfigured terminal development environment"
  homepage "https://github.com/useteploy/teploy-trmnl"
  url "https://github.com/useteploy/teploy-trmnl/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "7663cee657fa7c119ac33547f92c76103318c439bbb7abe8b19de1db7c2dd551"
  version "0.1.2"
  license "MIT"
  head "https://github.com/useteploy/teploy-trmnl.git", branch: "main"

  depends_on "neovim"
  depends_on "zellij"
  depends_on "yazi"
  depends_on "lazygit"
  depends_on "fzf"
  depends_on "zoxide"
  depends_on "ripgrep"
  depends_on "fd"
  depends_on "bat"
  depends_on "eza"
  depends_on "git-delta"
  depends_on "starship"
  depends_on "btop"
  depends_on "tldr"
  depends_on "gh"
  depends_on "jq"
  # git-credential-manager is a cask on macOS and a formula on linuxbrew —
  # Homebrew tap formulas can't depend on casks, and dual-paths get rejected.
  # Made it optional and instructed through caveats below.

  def install
    bin.install "bin/trmnl"

    # Install all config files to share/trmnl/
    (share/"trmnl").install "config/nvim"
    (share/"trmnl").install "config/zellij"
    (share/"trmnl").install "config/yazi"
    (share/"trmnl").install "config/ghostty"
    (share/"trmnl").install "config/starship.toml"
    (share/"trmnl").install "config/trmnl-gitconfig"
    (share/"trmnl").install "config/zshrc-block"
  end

  def caveats
    <<~EOS
      To complete setup, run:
        trmnl setup

      Then restart your terminal or run:
        source ~/.zshrc

      For a Nerd Font (needed for icons), install:
        brew install --cask font-jetbrains-mono-nerd-font

      Recommended terminal emulator:
        brew install --cask ghostty
      Ghostty config available at: #{share}/trmnl/ghostty/config

      Optional — git credential caching over HTTPS:
        brew install --cask git-credential-manager     # macOS
        brew install git-credential-manager            # Linux

      Useful commands:
        trmnl keys      — keybind cheat sheet
        trmnl doctor    — check installation
        trmnl uninstall — remove configs
    EOS
  end
end
