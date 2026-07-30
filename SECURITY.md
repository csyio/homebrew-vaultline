# Güvenlik Politikası — tap

*[English below](#security-policy--tap)*

Bu depo bir Homebrew tap'idir. Kendi başına kod çalıştırmaz, ama bir şeyi
belirler: **kullanıcının makinesine hangi paketin kurulacağını.** Bu yüzden
buradaki bir değişiklik, uygulamanın kendisindeki bir açık kadar ciddidir.

## Bildirim

Bu tap'te bir güvenlik sorunu bulduysanız **issue açmayın.**

[Özel güvenlik bildirimi açın](https://github.com/csyio/homebrew-vaultline/security/advisories/new) —
bildiriminiz yalnızca depo sahibi tarafından görülür.

Sorun uygulamanın kendisindeyse (kriptografi, kasa dosyası, arayüz) bildirimi
[vaultline-app tarafına](https://github.com/csyio/vaultline-app/security/advisories/new)
yapın.

İlk yanıt için hedef süre **72 saattir**.

## Kapsam

**Kapsam içinde**

- Cask'taki `url` veya `sha256`'nın yanlış ya da manipüle edilmiş olması
- Cask'ın, sürümde yayımlanan `SHA256SUMS.txt` ile uyuşmayan bir paketi
  göstermesi
- `zap` listesinin kullanıcı verisini beklenmedik biçimde silmesi
- İş akışlarında (`.github/workflows/`) kod enjeksiyonuna veya yetki
  yükseltmeye açık bir nokta
- Bu depoya yazma yetkisinin ele geçirilmesine dair bir bulgu

**Kapsam dışı**

- Vaultline uygulamasının içindeki açıklar → vaultline-app deposuna bildirin
- Homebrew'un kendi altyapısındaki açıklar →
  [Homebrew güvenlik politikası](https://github.com/Homebrew/brew/security/policy)
- Resmî olmayan bir tap'ten kurulum yaparken Homebrew'un onay istemesi
  (bu bir açık değil, bilinçli bir güvenlik özelliğidir)

## Kurduğunuz şeyi kendiniz doğrulayabilirsiniz

Bana güvenmenizi gerektirmeyen bir yol var. Cask'ın gösterdiği özet ile
sürümün yayımlanmış manifestosunu karşılaştırın:

```sh
brew cat --cask csyio/vaultline/vaultline | grep -E '^  (version|sha256) '
```

```sh
curl -fsSL https://github.com/csyio/vaultline-app/releases/download/v0.1.0/SHA256SUMS.txt
```

Birinci komutun verdiği `sha256`, ikincinin çıktısındaki özetle aynı olmalıdır.
Aynı değilse **kurmayın** ve yukarıdaki yoldan bildirin.

İndirdiğiniz `.dmg` dosyasını doğrudan doğrulamak isterseniz:

```sh
shasum -a 256 ~/Downloads/Vaultline_0.1.0_universal.dmg
```

Bu karşılaştırma ayrıca her değişiklikte ve haftada bir otomatik olarak
çalışır — bkz. [`audit.yml`](.github/workflows/audit.yml).

---

<a name="security-policy--tap"></a>

# Security Policy — tap

This repository is a Homebrew tap. It runs no code of its own, but it decides
one thing: **which package gets installed on a user's machine.** A change here
is therefore as serious as a vulnerability in the application itself.

## Reporting

If you find a security problem in this tap, **do not open an issue.**

[Open a private security advisory](https://github.com/csyio/homebrew-vaultline/security/advisories/new) —
your report is visible only to the repository owner.

If the problem is in the application itself (cryptography, vault file,
interface), report it on the
[vaultline-app side](https://github.com/csyio/vaultline-app/security/advisories/new).

The target for a first response is **72 hours**.

## Scope

**In scope**

- The cask's `url` or `sha256` being wrong or tampered with
- The cask pointing at a package that does not match the `SHA256SUMS.txt`
  published with the release
- The `zap` list deleting user data unexpectedly
- Anything in the workflows (`.github/workflows/`) open to code injection or
  privilege escalation
- Any finding about write access to this repository being compromised

**Out of scope**

- Vulnerabilities inside the Vaultline application → report on vaultline-app
- Vulnerabilities in Homebrew's own infrastructure →
  [Homebrew security policy](https://github.com/Homebrew/brew/security/policy)
- Homebrew asking for approval when installing from an unofficial tap — that is
  a deliberate security feature, not a vulnerability

## You can verify what you install, yourself

There is a way that does not require trusting me. Compare the digest the cask
reports against the release's published manifest:

```sh
brew cat --cask csyio/vaultline/vaultline | grep -E '^  (version|sha256) '
```

```sh
curl -fsSL https://github.com/csyio/vaultline-app/releases/download/v0.1.0/SHA256SUMS.txt
```

The `sha256` from the first command must match the digest in the second one's
output. If they do not, **do not install**, and report it through the channel
above.

To verify a `.dmg` you have already downloaded:

```sh
shasum -a 256 ~/Downloads/Vaultline_0.1.0_universal.dmg
```

This comparison also runs automatically on every change and once a week — see
[`audit.yml`](.github/workflows/audit.yml).
