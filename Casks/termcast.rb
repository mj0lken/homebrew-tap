cask "termcast" do
  arch arm: "", intel: "-Universal"

  version "0.3.0"
  sha256 arm:   "66398d24bbb4b6d019b6deb4404ee325e5542b51b7cbd1162e8333663c941a45",
         intel: "d24e60a91acb47f8af70e3898a75a0e76f4e6ef3c997e444f180bfe229a30b6c"

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
