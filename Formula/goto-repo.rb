class GotoRepo < Formula
  desc "Jump to any git repo under your source root by its directory name"
  homepage "https://github.com/RiceKrisBs/goto"
  url "https://github.com/RiceKrisBs/goto/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "7c25fed4931215ba8c2d3121f3132568ff8082e4430a3694522afb1ac74cec2f"
  license "MIT"

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
