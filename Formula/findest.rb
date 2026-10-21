class Findest < Formula
  desc "Fast, keyboard-friendly file browser for macOS"
  homepage "https://github.com/ariel-bentu/findest"
  url "https://github.com/ariel-bentu/findest/releases/download/v0.10.0/findest-0.10.0-macos.tar.gz"
  sha256 "b79d3970076969644cb2ca77f0b62084c92d0819e6a330c417a91246b17d2855"
  license "MIT"

  bottle do
    root_url "https://github.com/ariel-bentu/findest/releases/download/v0.10.0"
    sha256 cellar: :any_skip_relocation, all: "4d3a876191d571906f9630841e34bb5426b1dd5a96a905fcc5343b7512b58031"
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
