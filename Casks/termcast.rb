cask "termcast" do
  arch arm: "", intel: "-Universal"

  version "0.2.0"
  sha256 arm:   "b5dd5dea0a7614813047b93a3b6eaedaeefea644981fe3fd20a47a601d82f2ec",
         intel: "7dfb5cd7f29dafed49f77c6a2dee4a95a3a82e4e3523cda255060f134b8579b7"

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
