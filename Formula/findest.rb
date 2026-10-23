class Findest < Formula
  desc "Fast, keyboard-friendly file browser for macOS"
  homepage "https://github.com/ariel-bentu/findest"
  url "https://github.com/ariel-bentu/findest/releases/download/v0.11.0/findest-0.11.0-macos.tar.gz"
  sha256 "c9baa91143c889afa72faa73b84cc323f1080f0bd7b93efee07a78f38e33b318"
  license "MIT"

  bottle do
    root_url "https://github.com/ariel-bentu/findest/releases/download/v0.11.0"
    sha256 cellar: :any_skip_relocation, all: "13d781d02f84a4a99cd9a8114fcc5d6f8a5b6451ebb5793907dd654ae79f60ac"
  end

  depends_on :macos

  def install
    bin.install "findest"
  end

  def caveats
    <<~EOS
      Run `findest` once to install Findest.app (into /Applications, or
      ~/Applications if that isn't writable) and open it. After
      `brew upgrade findest`, run `findest` again to update the app.

      `findest <folder>` opens a folder. Cloud drives and the Trash need
      Full Disk Access: System Settings > Privacy & Security.

      `findest search <query>` searches file names from the terminal.
      To let AI agents (Claude Code) use it:
        findest skill install
    EOS
  end

  test do
    assert_predicate bin/"findest", :executable?
    assert_match "findest search", shell_output("#{bin}/findest help")
  end
end
