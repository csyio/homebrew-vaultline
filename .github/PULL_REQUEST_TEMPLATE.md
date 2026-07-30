## Ne değişti?

<!-- Bir iki cümle. -->

## Kontrol listesi

- [ ] `brew style csyio/vaultline` temiz
- [ ] `brew audit --cask --online --strict csyio/vaultline/vaultline` temiz
- [ ] Bu PR **sürüm yükseltmesi değil**
      (sürüm yükseltme elle yapılmaz → [`bump.yml`](https://github.com/csyio/homebrew-vaultline/blob/main/.github/workflows/bump.yml))
- [ ] `zap` listesine yol eklediysem, o yolun uygulamayı çalıştırdıktan sonra
      gerçekten oluştuğunu **doğruladım** ve nasıl doğruladığımı aşağıda yazdım
- [ ] Kasa (`.vault`) veya yedek (`.vaultbak`) dosyalarına dokunan bir yol
      **eklemedim**

## `zap` doğrulaması

<!--
  Yalnızca zap listesine dokunduysanız doldurun.
  Örnek: "Uygulamayı kurup açtım, bir kasa oluşturdum, kapattım. Ardından
  `ls -la ~/Library/...` çıktısında bu klasörün oluştuğunu gördüm."
-->

## Güvenlik

- [ ] Bu PR bir güvenlik açığını ifşa etmiyor
      (ediyorsa: PR'ı kapatın, [özel bildirim](https://github.com/csyio/homebrew-vaultline/security/advisories/new) kullanın)
