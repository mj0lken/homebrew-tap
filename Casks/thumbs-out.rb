cask "thumbs-out" do
  version "1.2.0"
  sha256 "6a34482bcc342e357c6e658082ce7b18bf986905d228245b1046306c24e4a700"

  url "https://github.com/mj0lken/thumbs-out/releases/download/v#{version}/thumbs-out-#{version}-arm64.zip"
  name "thumbs-out"
  desc "Keeps the computer awake while AI coding agents run commands"
  homepage "https://mj0lken.github.io/thumbs-out/"

  livecheck do
    url :url
    strategy :github_latest
  end

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
