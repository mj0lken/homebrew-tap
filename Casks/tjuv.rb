cask "tjuv" do
  version "1.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/mj0lken/tjuv/releases/download/v#{version}/tjuv-#{version}-arm64.zip"
  name "Tjuv"
  desc "Physical motion-sensing thief alarm for Apple Silicon MacBooks"
  homepage "https://mj0lken.github.io/tjuv/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Tjuv.app"

  uninstall quit: "com.mj0lken.tjuv"

  zap delete: "/etc/sudoers.d/tjuv",
      trash:  "~/Library/Preferences/com.mj0lken.tjuv.plist"

  caveats <<~EOS
    Tjuv isn't notarized by Apple yet. The first time you open it, macOS
    blocks it: click Done, then open System Settings > Privacy & Security and
    click Open Anyway. You only need to do this once.

    If you set up closed-lid mode, remove it in Tjuv's menu before
    uninstalling.
  EOS
end
