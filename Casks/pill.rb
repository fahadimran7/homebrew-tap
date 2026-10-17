cask "pill" do
  version "1.6.8"
  sha256 "3aeab81cb69173f27c48d7b071fd6f53801f8580a09e1759c24c0e5660c291ea"

  url "https://dl.trypill.app/Pill-#{version}.dmg"
  name "Pill"
  desc "Floating scratchpad that pastes"
  homepage "https://trypill.app/"

  livecheck do
    skip "Updated by Pill's release script"
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
    Pill isn't notarized by Apple yet, so macOS blocks the first launch.
    Open Pill once, then go to System Settings → Privacy & Security and
    click "Open Anyway" next to the message about Pill. Or run:

      xattr -dr com.apple.quarantine #{appdir}/Pill.app

    Pill then asks for Accessibility access so it can paste.
  EOS
end
