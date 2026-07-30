# Vaultline Homebrew Cask
# Kurulum: brew tap csyio/vaultline && brew install --cask vaultline
#
# sha256, surumdeki SHA256SUMS.txt ile birebir ayni olmali. Yeni surumde
# hem version hem sha256 guncellenir.
cask "vaultline" do
  version "0.1.0"
  sha256 "b4415c720c8ce0144adfb0c6903ed73c8bec2e822ab2786aea5cb8fba068a927"

  url "https://github.com/csyio/vaultline-app/releases/download/v#{version}/Vaultline_#{version}_universal.dmg"
  name "Vaultline"
  desc "Yerel, sifir-bilgi masaustu sifre yoneticisi"
  homepage "https://github.com/csyio/vaultline-app"

  # Notarize edilmis; Gatekeeper temiz gecer.
  depends_on macos: :catalina

  app "Vaultline.app"

  zap trash: [
    "~/Library/Application Support/com.csyio.vaultline",
    "~/Library/Preferences/com.csyio.vaultline.plist",
    "~/Library/Saved Application State/com.csyio.vaultline.savedState",
  ]
end
