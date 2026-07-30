# homebrew-vaultline

[![Cask denetimi](https://github.com/csyio/homebrew-vaultline/actions/workflows/audit.yml/badge.svg)](https://github.com/csyio/homebrew-vaultline/actions/workflows/audit.yml)
[![Lisans](https://img.shields.io/badge/lisans-BSD--2--Clause-informational)](LICENSE)

[Vaultline](https://github.com/csyio/vaultline-app) için Homebrew tap'i —
yerel, sıfır‑bilgi masaüstü şifre yöneticisi (macOS).

**Türkçe** · [English](README.en.md)

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

## Bu tap nasıl doğrulanıyor?

Cask yalnızca elle sürdürülmüyor; iki iş akışı bekçilik ediyor:

| İş akışı | Ne yapar |
| :-- | :-- |
| [`audit.yml`](.github/workflows/audit.yml) | Her değişiklikte ve haftada bir `brew style` ile `brew audit --online --strict` çalıştırır. Ayrıca cask'taki `sha256`'nın sürümle birlikte yayımlanan `SHA256SUMS.txt` değeriyle aynı olduğunu kontrol eder — bir cask kimse dokunmasa bile bozulabilir ve bunu kullanıcıdan önce görmek isteriz. |
| [`bump.yml`](.github/workflows/bump.yml) | Cask'ı yeni sürüme yükseltir. Özet, sürümün kendi `SHA256SUMS.txt` dosyasından okunur ve gerçekten indirilen paketle yeniden karşılaştırılır — elle yazılmaz. |

Paket, Apple Developer ID ile imzalı ve Apple tarafından notarize edilmiştir.
Cask'taki `sha256`, [sürümdeki](https://github.com/csyio/vaultline-app/releases/latest)
`SHA256SUMS.txt` ile birebir aynıdır.

## Sorun bildirimi

- **Bu tap'le** ilgili sorun (kurulum, kaldırma, cask tanımı) →
  [buradan issue açın](https://github.com/csyio/homebrew-vaultline/issues)
- **Uygulamanın kendisiyle** ilgili sorun →
  [vaultline-app issues](https://github.com/csyio/vaultline-app/issues)
- **Güvenlik açığı** → issue açmayın, [SECURITY.md](SECURITY.md) dosyasına bakın

## Lisans

[BSD 2-Clause](LICENSE) — Homebrew'un kendi lisansıyla aynı. Yalnızca bu
deponun içeriğini (cask tanımı, belgeler, iş akışları) kapsar.

Cask'ın kurduğu Vaultline uygulaması
[ayrı şartlara](https://github.com/csyio/vaultline-app/blob/main/LICENSE) tabidir.
