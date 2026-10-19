class Findest < Formula
  desc "Fast, keyboard-friendly file browser for macOS"
  homepage "https://github.com/ariel-bentu/findest"
  url "https://github.com/ariel-bentu/findest/releases/download/v0.9.0/findest-0.9.0-macos.tar.gz"
  sha256 "dd8abb559f66d98ca42a71ae34852b6c228b1e374b56159f347385a17103c7e2"
  license "MIT"

  bottle do
    root_url "https://github.com/ariel-bentu/findest/releases/download/v0.9.0"
    sha256 cellar: :any_skip_relocation, all: "1f06e60a7b63db09e44469034a5fa18016c2e31d3bca4e4da2eb8437b462befb"
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
    EOS
  end

  test do
    assert_predicate bin/"findest", :executable?
  end
end
