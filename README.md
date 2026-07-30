# homebrew-vaultline

[Vaultline](https://github.com/csyio/vaultline-app) için Homebrew tap'i —
yerel, sıfır‑bilgi masaüstü şifre yöneticisi (macOS).

## Kurulum

```sh
brew tap csyio/vaultline
brew install --cask vaultline
```

İlk kurulumda Homebrew, resmî olmayan bir tap'ten cask yüklerken açık onay
ister (Homebrew 6.0+ güvenlik özelliği). İstenirse:

```sh
brew trust --cask csyio/vaultline/vaultline
```

komutunu çalıştırıp kurulumu tekrarlayın. Bu, tap'in cask tanımına
(indirme adresi + SHA256 doğrulaması) güvendiğinizi belirtir.

## Güncelleme

```sh
brew upgrade --cask vaultline
```

## Kaldırma

Yalnızca uygulamayı kaldırır, ayarları bırakır:

```sh
brew uninstall --cask vaultline
```

Uygulama verilerini de temizler:

```sh
brew uninstall --zap --cask vaultline
```

`--zap` şu klasörleri siler:

```
~/Library/Application Support/com.csyio.vaultline
~/Library/Caches/com.csyio.vaultline
~/Library/HTTPStorages/com.csyio.vaultline
~/Library/Preferences/com.csyio.vaultline.plist
~/Library/Saved Application State/com.csyio.vaultline.savedState
~/Library/WebKit/com.csyio.vaultline
```

> ### ⚠️ Kasa dosyanız silinmez
>
> `--zap` dahil **hiçbir kaldırma komutu** kasa dosyanıza (`.vault`) veya
> yedeklerinize (`.vaultbak`) dokunmaz. Onlar sizin seçtiğiniz konumda durur
> ve sizin verinizdir.
>
> Bu bilinçli bir tasarım: bir kaldırma komutunun tüm parolalarınızı
> silmesi kabul edilemez olurdu. Kasayı da silmek istiyorsanız dosyayı
> **kendiniz** silmelisiniz. Nerede olduğunu hatırlamıyorsanız:
>
> ```sh
> mdfind -name '.vault' | grep -i vault
> ```
>
> Kasa dosyası şifrelidir; silmeden önce ana parolanızı unutmadığınızdan
> ve içindekilere artık ihtiyacınız olmadığından emin olun. **Geri dönüşü
> yoktur.**

---

Paket, Apple Developer ID ile imzalı ve Apple tarafından notarize edilmiştir.
Cask'taki `sha256`, [sürümdeki](https://github.com/csyio/vaultline-app/releases/latest)
`SHA256SUMS.txt` ile birebir aynıdır.
