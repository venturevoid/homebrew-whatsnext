cask "whats-next" do
  version "0.4.9"
  sha256 "ba6aa49cbbacc12bdb916536f7be9fc73f391bf59912937b1dcf2e3f4eaa4c8f"

  url "https://whatsnext.venturevoid.com/downloads/WhatsNext-#{version}.dmg"
  name "What's Next"
  desc "Menu-bar app that shows your next meeting and joins it in one click"
  homepage "https://whatsnext.venturevoid.com/"

  # Track new versions from the Sparkle appcast the app already publishes.
  # The appcast carries both shortVersionString and a build number;
  # `&:short_version` keeps livecheck comparing against the marketing
  # version only (0.4.8), which is what the cask pins.
  livecheck do
    url "https://whatsnext.venturevoid.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  # The app updates itself in-place via Sparkle (EdDSA-signed appcast).
  auto_updates true
  # Hard requirement: the UI is built on the macOS 26 (Tahoe) Liquid
  # Glass APIs, called without availability fallbacks — it will not run
  # on earlier systems.
  depends_on macos: :tahoe

  app "WhatsNext.app"

  # Quit the running menu-bar agent before replacing/removing it.
  uninstall quit: "com.venturevoid.WhatsNext"

  # `zap` removes every file artefact the (sandboxed) app leaves behind.
  # Almost everything lives under the sandbox container; the rest are the
  # standard per-bundle-id Library locations macOS may create.
  #
  # Not removable from a cask (macOS limitation, not an omission):
  #   - the Login Item registered via SMAppService — macOS prunes it
  #     automatically once the app bundle is gone.
  #   - the Keychain item (service "com.venturevoid.WhatsNext") holding
  #     the Google token — there is no cask primitive for Keychain; the
  #     entry is inert without the app and can be removed from Keychain
  #     Access if desired.
  zap trash: [
    "~/Library/Application Scripts/com.venturevoid.WhatsNext",
    "~/Library/Caches/com.venturevoid.WhatsNext",
    "~/Library/Containers/com.venturevoid.WhatsNext",
    "~/Library/HTTPStorages/com.venturevoid.WhatsNext",
    "~/Library/Preferences/com.venturevoid.WhatsNext.plist",
    "~/Library/Saved Application State/com.venturevoid.WhatsNext.savedState",
  ]
end
