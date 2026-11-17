cask "termcast" do
  arch arm: "", intel: "-Universal"

  version "0.3.1"
  sha256 arm:   "f308cceda9a9d33081cf2c81a5426d21795c86d5164fb085fc7260d6b96163e6",
         intel: "87aef4f82a012997607216400d0319322311c6364039b41f19b7d73cb16d15d4"

  url "https://github.com/mj0lken/TermCast/releases/download/v#{version}/Termcast#{arch}-#{version}.dmg"
  name "Termcast"
  desc "Native macOS launcher and Raycast runtime with integrated multi-tab PTY terminal"
  homepage "https://mj0lken.github.io/TermCast/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "Termcast.app"

  uninstall quit: "com.mj0lken.termcast"

  zap trash: [
    "~/.config/termcast",
    "~/Library/Application Support/com.mj0lken.termcast",
    "~/Library/Application Support/CrashReporter/ClipboardTextHelper_*.plist",
    "~/Library/Application Support/CrashReporter/FileIndexHelper_*.plist",
    "~/Library/Application Support/CrashReporter/Termcast_*.plist",
    "~/Library/Application Support/CrashReporter/Tinycast Dictation_*.plist",
    "~/Library/Caches/com.mj0lken.termcast",
    "~/Library/Caches/com.mj0lken.termcast.dictation",
    "~/Library/Preferences/com.mj0lken.termcast.plist",
  ]

  caveats <<~EOS
    Termcast isn't notarized by Apple yet. The first time you open it, macOS
    blocks it: click Done, then open System Settings > Privacy & Security and
    click Open Anyway. You only need to do this once.
  EOS
end
