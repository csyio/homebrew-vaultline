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

```sh
brew uninstall --cask vaultline
```

`--zap` ile uygulama verilerini de temizleyebilirsiniz:

```sh
brew uninstall --zap --cask vaultline
```

> **Not:** Vaultline'ın kasa dosyaları uygulamanın veri klasöründe **değil**,
> sizin seçtiğiniz konumdadır — `--zap` onlara dokunmaz. Kasa dosyanızı ayrıca
> yedeklemeniz sizin sorumluluğunuzdadır.

---

Paket, Apple Developer ID ile imzalı ve Apple tarafından notarize edilmiştir.
Cask'taki `sha256`, [sürümdeki](https://github.com/csyio/vaultline-app/releases/latest)
`SHA256SUMS.txt` ile birebir aynıdır.
