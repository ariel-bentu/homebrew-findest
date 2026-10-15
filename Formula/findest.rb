class Findest < Formula
  desc "Fast, keyboard-friendly file browser for macOS"
  homepage "https://github.com/ariel-bentu/findest"
  url "https://github.com/ariel-bentu/findest/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "08b60474a48d529170f140572cb8c0a90db4a7f889f3b455e971ddf90f17432f"
  license "MIT"
  head "https://github.com/ariel-bentu/findest.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/findest")
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
