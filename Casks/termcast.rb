cask "termcast" do
  arch arm: "", intel: "-Universal"

  version "0.1.0"
  sha256 arm:   "01d7c09ae93d28b5f5d6efb8f40f62e40cfa4b4ae1bdecc7e1d1e368cfaef8f9",
         intel: "b3035a51ffdd00bc953d7a665a7dfeab722d38cd91be1a18d09ea082ac2c7e04"

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
