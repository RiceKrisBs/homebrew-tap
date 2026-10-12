class GotoRepo < Formula
  desc "Jump to any git repo under your source root by its directory name"
  homepage "https://github.com/RiceKrisBs/goto"
  url "https://github.com/RiceKrisBs/goto/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "9fa7c3f77bce23ede797a2b120dbcb8444912eed830390296761839e95065b59"
  license "MIT"

  bottle do
    root_url "https://github.com/RiceKrisBs/homebrew-tap/releases/download/goto-repo-0.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b787b133ed6eea3c9cf6570cdccd2151c3da0451542f1b1b4bb8414f279bda9d"
    sha256 cellar: :any,                 x86_64_linux:  "40bed7c5940f6fe090bf12db6ed56f46baf6309d7dfb6b6450c0ada40a1344f8"
  end

  depends_on "rust" => :build
  depends_on "fzf"

  def install
    system "cargo", "install", *std_cargo_args
    # Not pkgshare (share/goto-repo): the documented source line is share/goto/goto.zsh.
    (share/"goto").install "goto.zsh"
  end

  def caveats
    <<~EOS
      To define the `gt` command, add this to your ~/.zshrc and open a new shell:
        source "#{HOMEBREW_PREFIX}/share/goto/goto.zsh"
    EOS
  end

  test do
    assert_match "gt #{version}", shell_output("#{bin}/gt-bin --version")

    (testpath/"src/github.com/acme/demo/.git").mkpath
    ENV["GOTO_ROOT"] = testpath/"src"
    ENV["XDG_CACHE_HOME"] = testpath/"cache"
    assert_equal (testpath/"src/github.com/acme/demo").to_s,
                 shell_output("#{bin}/gt-bin demo").strip
    shell_output("#{bin}/gt-bin nope", 1)

    assert_match "gt()", (share/"goto/goto.zsh").read
  end
end
