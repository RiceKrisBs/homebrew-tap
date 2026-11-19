class GotoRepo < Formula
  desc "Jump to any git repo under your source root by its directory name"
  homepage "https://github.com/RiceKrisBs/goto"
  url "https://github.com/RiceKrisBs/goto/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "f19cc6bdd9d5059bbba14644ae99d27e96bc906797f560d5989804e6164ab842"
  license "MIT"

  bottle do
    root_url "https://github.com/RiceKrisBs/homebrew-tap/releases/download/goto-repo-0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a4fe006c590e9f378cb6469c31c56a6783bc56a58577ae6661c37b928797d99c"
    sha256 cellar: :any,                 x86_64_linux:  "4cc96ae3175a0797de481791aeed56410eb9cbdb30128ce4728c530700768717"
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
