# Katkı rehberi

Bu depo bir Homebrew tap'idir: içinde tek bir cask tanımı
([`Casks/vaultline.rb`](Casks/vaultline.rb)), belgeler ve iki iş akışı var.
Vaultline uygulamasının kaynak kodu burada değil.

Küçük bir depo, ama kritik bir işi var: **kullanıcının makinesine hangi paketin
kurulacağını burası belirliyor.** Bu yüzden buradaki bir hatanın karşılığı,
uygulamadaki bir hatanın karşılığından az değil.

## Ne kabul edilir?

| Katkı | Nasıl |
| :-- | :-- |
| Cask'ta hata (yanlış `url`, `sha256`, eksik `zap` yolu) | Doğrudan pull request açabilirsiniz. |
| Kurulum/kaldırma sorunu | [Issue açın](../../issues/new/choose) — Homebrew ve macOS sürümünüzle birlikte. |
| Belge düzeltmesi | Doğrudan pull request. |
| Uygulamanın kendisiyle ilgili sorun | [vaultline-app](https://github.com/csyio/vaultline-app/issues) tarafına. |
| Güvenlik açığı | Issue açmayın → [SECURITY.md](SECURITY.md) |

## `zap` listesine ekleme öneriyorsanız

Bu liste `brew uninstall --zap` ile silinecek yolları içerir; yani yanlış bir
girdi **kullanıcı verisi siler.** Bu yüzden tahminle değil, gözlemle
doldurulur.

Bir yol önerecekseniz, o yolun uygulamayı çalıştırdıktan sonra dosya
sisteminde gerçekten oluştuğunu doğrulayın ve PR'da nasıl doğruladığınızı
yazın.

> Kasa dosyaları (`.vault`) ve yedekler (`.vaultbak`) bu listeye **hiçbir
> koşulda eklenmez.** Bir kaldırma komutunun kullanıcının tüm parolalarını
> silmesi kabul edilemez. Bu, tartışmaya açık bir tercih değil.

## Sürüm yükseltme PR'ı açmayın

`version` ve `sha256`'yı elle düzenlemek, bu depoda yapılabilecek en riskli
kopyala‑yapıştır işidir. Bunun yerine
[`bump.yml`](.github/workflows/bump.yml) iş akışı kullanılır: özeti sürümün
kendi `SHA256SUMS.txt` dosyasından okur ve gerçekten indirilen paketle
yeniden karşılaştırır.

Yeni bir sürüm çıktığını fark ettiyseniz PR açmak yerine issue açmanız yeterli.

## Değişikliğinizi göndermeden önce

Cask'a dokunduysanız yerelde çalıştırın:

```sh
brew tap csyio/vaultline
brew style csyio/vaultline
brew audit --cask --online --strict csyio/vaultline/vaultline
```

Aynı denetimler PR açıldığında CI'da da çalışır — ama yerelde görmek daha
hızlıdır.
