class Hop < Formula
  desc "Fuzzy git worktree switcher powered by fzf"
  homepage "https://github.com/tjgoldblatt/hop"
  url "https://github.com/tjgoldblatt/hop/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a01576078659fc7d41500cd9c685dab341583eede3f1fea795151f3624a14791"
  license "MIT"

  depends_on "fzf"

  def install
    share.install "hop.zsh"
    (share/"hop.sh").make_symlink share/"hop.zsh"
  end

  def caveats
    <<~EOS
      To use hop, add this to your shell config (~/.zshrc or ~/.bashrc):
        source #{opt_share}/hop.zsh

      Then restart your shell or run:
        source #{opt_share}/hop.zsh
    EOS
  end

  test do
    system "bash", "-c", "source #{share}/hop.zsh && type hop"
  end
end
