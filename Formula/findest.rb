class Findest < Formula
  desc "Fast, keyboard-friendly file browser for macOS"
  homepage "https://github.com/ariel-bentu/findest"
  url "https://github.com/ariel-bentu/findest/releases/download/v0.8.0/findest-0.8.0-macos.tar.gz"
  sha256 "a8a0e35fc18531b93de474aa69c9090a454d6b4d460684e2bc885894594e2e93"
  license "MIT"

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
    EOS
  end

  test do
    assert_predicate bin/"findest", :executable?
  end
end
