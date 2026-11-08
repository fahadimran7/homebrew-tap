cask "pill" do
  version "1.6.9"
  sha256 "6102a3dc039509de7ad3e7e71d8b872061654595ba7c29f4fe55ebcdad9bc58c"

  url "https://github.com/fahadimran7/homebrew-tap/releases/download/v#{version}/Pill-#{version}.dmg",
      verified: "github.com/fahadimran7/homebrew-tap/"
  name "Pill"
  desc "Floating scratchpad that pastes"
  homepage "https://www.fahadimran.me/pill"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Pill.app"

  uninstall quit: "com.fahadimran.Pill"

  zap trash: [
    "~/Library/Application Support/Pill",
    "~/Library/Caches/com.fahadimran.Pill",
    "~/Library/HTTPStorages/com.fahadimran.Pill",
    "~/Library/Preferences/com.fahadimran.Pill.plist",
    "~/Library/Saved Application State/com.fahadimran.Pill.savedState",
  ]

  caveats <<~EOS
    Pill asks for Accessibility access on first launch so it can paste. If you
    updated from 1.6.8 or earlier, allow it again: Pill is now signed differently.
  EOS
end
