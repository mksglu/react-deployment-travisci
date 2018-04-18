Merhaba,

Yerel sunucumuzda, `touch .travis.yml` komutu ile yeni bir TravisCI yapılandırma dosyası oluşturalım. TravisCI aracı için geçerli tüm ayarlarımız burada bulunacaktır. Uzak sunucu bağlantısı için yeni bir anahtar oluşturalım. `ssh-keygen -t rsa -N "" -C "e-posta@gmail.com" -f travis_rsa` Yerel sunucumuzda `travis_rsa` isminde yeni bir dosya oluşması gerek. Bu dosyanın şifrelenmesi ve `travis.yml` dosyamıza eklenmesi için `travis encrypt-file travis_rsa --add` komutunu çalıştıralım. Bu dosyanın herhangi bir güvenlik açığı oluşturmamasından emin olmak için `rm travis_rsa` komutunu uygulayalım. Yerel dizinimizde oluşan herkese açık (public) anahtarımızı kopyalayım ve bu dosyayı da `rm travis_rsa.pub` komutu ile silelim.

Uzak sunucumuza bağlanalım. `mkdir ~/.ssh` komutu ile ana dizinimizde gizli bir ssh dizini oluşturalım. Muhtemelen varsayılan olarak sizde bulunacaktır. Bu durumda size verdiği uyarıyı yoksayabilirsiniz. Uygulama adımlarına bu dizinin izinlerini güncelleyerek devam edelim. `chmod 700 ~/.ssh` komutu ile dizin iznimizi güncelliyoruz. Ve bu dizin içerisinde bulunan `authorized_keys` dosyasını güncelleyelim. Bir önceki adımda kopyaladığımız `travis_rsa.pub` dosyasında yer alan herkese açık anahtarımızı `nano ~/.ssh/authorized_keys` komutu ile `authorized_keys` dosyasının içerisine kaydedelim. `chmod 600 ~/.ssh/authorized_keys` komutu ile de izinlerini güncelleyelim.

Tebrikler, TravısCI aracı ile çalışmak için gerekli tüm yapılandırmaları gerçekleştirdiniz! GitHub reponuzda bulunan dosyaları uzak GıtHub sunucusuna göndererek TravıCI aracının çalışmasını tetikleyebilir, diledğiniz testlerden geçirebilir ve uzak sunucunuza yükleyebilirsiniz.

GitHub repomozda bulunan, `DEPLOY_USER` gibi değişkenleri TravisCI arayüzünde `More Options` ve `Settings` sıralamasından sonra `Environment Variables` başlığı altında tanımlayabilirsiniz. Travis yapılandırma dosyasının içeririsinde yer alan komutları da TravisCI dökümanında araştırabilirsiniz.

Size diğer Continious Integration araçlarını sıralamak istiyorum. Bu anahtar kelimeleri araştırma yaparken kullanabilirsiniz.

* Forge Laravel
* Buddy Works
* CircleCI
* TravisCI

Teşekkürler.
Mert.
