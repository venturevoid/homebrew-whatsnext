cask "whats-next" do
  version :latest
  sha256 :no_check

  url "https://whatsnext.venturevoid.com/downloads/WhatsNext.dmg"
  name "What's Next"
  desc "Menu-bar app that shows your next meeting and joins it in one click"
  homepage "https://whatsnext.venturevoid.com/"

  # Hard requirement: the UI is built on the macOS 26 (Tahoe) Liquid
  # Glass APIs, called without availability fallbacks — it will not run
  # on earlier systems.
  depends_on macos: :tahoe

  app "WhatsNext.app"

  # Quit the running menu-bar agent before replacing/removing it.
  uninstall quit: "com.venturevoid.WhatsNext"

  # `zap` removes every file artefact the (sandboxed) app leaves behind.
  # Almost everything lives under the sandbox container; the rest are the
  # standard per-bundle-id Library locations macOS may create. The app
  # keeps itself up to date via Sparkle, so the cask is pinned to
  # :latest and just bootstraps the install.
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
