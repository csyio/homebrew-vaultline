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

  # `brew uninstall --zap` ile silinecek uygulama verileri.
  #
  # Bu liste, uygulama calistirildiktan sonra dosya sisteminde GERCEKTEN
  # olusan yollara bakilarak dogrulandi. WebKit ve Caches girdileri kritik:
  # webview, kullanilmasa bile WebsiteData (LocalStorage, IndexedDB) ve
  # ag onbellegi iskeletini olusturur. Listede olmasalardi `--zap` sonrasi
  # birkac yuz KB veri geride kalirdi.
  #
  # NOT: Kasa dosyaniz (.vault) ve yedekleriniz (.vaultbak) BU LISTEDE YOK
  # ve `--zap` onlara DOKUNMAZ. Onlar sizin sectiginiz konumda durur ve
  # sizin verinizdir — bir kaldirma komutunun tum parolalarinizi silmesi
  # kabul edilemez bir davranis olurdu.
  zap trash: [
    "~/Library/Application Support/com.csyio.vaultline",
    "~/Library/Caches/com.csyio.vaultline",
    "~/Library/HTTPStorages/com.csyio.vaultline",
    "~/Library/Preferences/com.csyio.vaultline.plist",
    "~/Library/Saved Application State/com.csyio.vaultline.savedState",
    "~/Library/WebKit/com.csyio.vaultline",
  ]
end
