cask "thumbs-out" do
  version "1.4.0"
  sha256 "7d2c0556d7a35689da1bcbc2837b251f82baff570efe46da97dcd2718950b14a"

  url "https://github.com/mj0lken/thumbs-out/releases/download/v#{version}/thumbs-out-#{version}-arm64.zip"
  name "thumbs-out"
  desc "Keeps the computer awake while AI coding agents run commands"
  homepage "https://mj0lken.github.io/thumbs-out/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "thumbs-out.app"

  uninstall quit: "com.mj0lken.thumbs-out"

  zap delete: "/etc/sudoers.d/thumbs-out",
      trash:  "~/Library/Preferences/com.mj0lken.thumbs-out.plist"

  caveats <<~EOS
    thumbs-out isn't notarized by Apple yet. The first time you open it, macOS
    blocks it: click Done, then open System Settings > Privacy & Security and
    click Open Anyway. You only need to do this once.

    If you turned on lid-closed mode, remove it in thumbs-out's Settings before
    uninstalling.
  EOS
end
