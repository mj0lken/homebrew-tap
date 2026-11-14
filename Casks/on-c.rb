cask "on-c" do
  version "1.0.3"
  sha256 "1ae17c35bb66dc03190f7faaa998388527f83ecc110dcbb507c3fa97dba9f6bc"

  url "https://github.com/mj0lken/on-c/releases/download/v#{version}/on-c-#{version}-arm64.zip"
  name "on/c"
  desc "Natural-language notepad calculator inspired by Numi"
  homepage "https://mj0lken.github.io/on-c/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "on-c.app"

  uninstall quit: "app.onc.calculator"

  zap trash: [
    "~/Library/Caches/app.onc.calculator",
    "~/Library/Preferences/app.onc.calculator.plist",
    "~/Library/Saved Application State/app.onc.calculator.savedState",
    "~/Library/WebKit/app.onc.calculator",
  ]

  caveats <<~EOS
    on/c isn't notarized by Apple yet. The first time you open it, macOS
    blocks it: click Done, then open System Settings > Privacy & Security and
    click Open Anyway. You only need to do this once.
  EOS
end
