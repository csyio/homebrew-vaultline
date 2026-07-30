# Vaultline Homebrew Cask
# Kurulum: brew tap csyio/vaultline && brew install --cask vaultline
#
# sha256, sürümdeki SHA256SUMS.txt ile birebir aynı olmalı. Yeni sürümde hem
# version hem sha256 güncellenir — ikisini elle değiştirmek yerine depodaki
# "Cask sürümünü yükselt" iş akışını kullanın, doğrulamayı o yapar.
cask "vaultline" do
  version "0.1.0"
  sha256 "b4415c720c8ce0144adfb0c6903ed73c8bec2e822ab2786aea5cb8fba068a927"

  url "https://github.com/csyio/vaultline-app/releases/download/v#{version}/Vaultline_#{version}_universal.dmg",
      verified: "github.com/csyio/vaultline-app/"
  name "Vaultline"
  desc "Local, zero-knowledge password manager"
  homepage "https://github.com/csyio/vaultline-app"

  # Yeni sürümü GitHub Releases üzerinden takip eder; `brew livecheck` ile
  # cask'ın geride kalıp kalmadığı görülebilir.
  livecheck do
    url :url
    strategy :github_latest
  end

  # Uygulama kendi kendini güncellemez; güncelleme Homebrew üzerinden gelir.
  auto_updates false
  # Notarize edilmiş; Gatekeeper temiz geçer.
  # Cask DSL'inde `depends_on macos:` varsayılan karşılaştırıcısı ">=",
  # yani bu satır "Catalina ve üzeri" demektir.
  depends_on macos: :catalina

  app "Vaultline.app"

  # `brew uninstall --zap` ile silinecek uygulama verileri.
  #
  # Bu liste, uygulama çalıştırıldıktan sonra dosya sisteminde GERÇEKTEN
  # oluşan yollara bakılarak doğrulandı. WebKit ve Caches girdileri kritik:
  # webview, kullanılmasa bile WebsiteData (LocalStorage, IndexedDB) ve ağ
  # önbelleği iskeletini oluşturur. Listede olmasalardı `--zap` sonrası
  # birkaç yüz KB veri geride kalırdı.
  #
  # NOT: Kasa dosyanız (.vault) ve yedekleriniz (.vaultbak) BU LİSTEDE YOK
  # ve `--zap` onlara DOKUNMAZ. Onlar sizin seçtiğiniz konumda durur ve
  # sizin verinizdir — bir kaldırma komutunun tüm parolalarınızı silmesi
  # kabul edilemez bir davranış olurdu.
  zap trash: [
    "~/Library/Application Support/com.csyio.vaultline",
    "~/Library/Caches/com.csyio.vaultline",
    "~/Library/HTTPStorages/com.csyio.vaultline",
    "~/Library/Preferences/com.csyio.vaultline.plist",
    "~/Library/Saved Application State/com.csyio.vaultline.savedState",
    "~/Library/WebKit/com.csyio.vaultline",
  ]
end
