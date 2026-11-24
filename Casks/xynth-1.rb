cask "xynth-1" do
  version "0.2.1"
  sha256 "5e8fca74ff1cbd5f1255e2c42a0b8e8ad009c790a0fb4bca632e35aa262fc86a"

  url "https://github.com/mj0lken/xynth-1/releases/download/v#{version}/XYNTH-1-v#{version}-arm64.zip"
  name "XYNTH-1"
  desc "Tactile Force Touch trackpad synthesizer for Apple Silicon MacBooks"
  homepage "https://mj0lken.github.io/xynth-1/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "XYNTH-1.app"

  uninstall quit: "com.xynth1.hapticsynth"

  zap trash: "~/Library/Preferences/com.xynth1.hapticsynth.plist"

  caveats <<~EOS
    XYNTH-1 isn't notarized by Apple yet. The first time you open it, macOS
    blocks it: click Done, then open System Settings > Privacy & Security and
    click Open Anyway. You only need to do this once.
  EOS
end
