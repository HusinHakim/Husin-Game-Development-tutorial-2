# Tutorial 2 - Introduction to Game Engine

**Nama:** Husin Hidayatul Hakim
**NPM:** 2306152481

---

## Latihan: Playtest

**1. Apa saja pesan log yang dicetak pada panel Output?**
Pesan log yang dicetak pada panel Output adalah:
- `"Platform initialized"`: Pesan ini tercetak satu kali saat awal permainan dimulai (saat fungsi `_ready()` pada script landasan dieksekusi).
- `"Reached objective!"`: Pesan ini tercetak saat objek pesawat (`BlueShip`) menyentuh atau masuk ke dalam area objektif.

**2. Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?**
Saat landasan digerakkan menjauh ke area bawah, **tidak ada** pesan log tambahan yang dicetak. Namun, ketika landasan digerakkan kembali ke atas hingga kapal menyentuh batas atas layar, pesan `"Reached objective!"` kembali dicetak (bahkan berulang kali selama pesawat terus bersinggungan dengan area tersebut).

**3. Buka scene MainLevel dengan tampilan workspace 2D. Apakah lokasi scene ObjectiveArea memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?**
Ya, sangat berkaitan. Berdasarkan observasi pada *workspace* 2D, letak objek `ObjectiveArea` diposisikan tepat di batas atas area permainan. Log `"Reached objective!"` dipicu oleh *signal* `body_entered` milik `ObjectiveArea` yang akan aktif hanya ketika ada *RigidBody2D* (dalam hal ini `BlueShip`) yang memasuki areanya. Itulah sebabnya pesan log tersebut hanya muncul ketika kita mendorong pesawat ke batas atas layar, dan tidak muncul ketika didorong ke bawah.

## Latihan: Memanipulasi Node dan Scene

**1. Apa fungsi dari node bertipe Sprite2D?**
Node `Sprite2D` berfungsi untuk menampilkan tekstur atau gambar 2D secara visual ke layar (Viewport). Tanpa node ini, objek di dalam game akan "tak kasat mata" karena hanya berupa data logika atau area fisika kosong tanpa representasi grafis.

**2. Apa perbedaan dari tipe RigidBody2D dan StaticBody2D?**
- **RigidBody2D**: Tipe *node* fisika yang sepenuhnya disimulasikan oleh *physics engine* Godot. Objek dengan tipe ini dipengaruhi oleh gravitasi, memiliki massa, bisa memantul, dan bisa didorong oleh objek lain. Cocok untuk karakter atau barang yang bisa jatuh/terlempar (seperti `BlueShip`).
- **StaticBody2D**: Tipe *node* fisika yang statis atau diam. Objek ini tidak terpengaruh oleh gravitasi maupun gaya dorong dari objek lain, tetapi benda lain tetap bisa bertabrakan dengannya. Sangat cocok digunakan untuk lantai, tembok, atau rintangan (seperti `StonePlatform`).

**3. Ubah nilai atribut Mass pada tipe RigidBody2D secara bebas di scene BlueShip, lalu coba jalankan scene MainLevel. Apa yang terjadi?**
Tidak ada yang berubah secara visual pada pergerakan jatuhnya pesawat maupun saat berinteraksi dengan landasan. Hal ini terjadi karena *physics engine* Godot menerapkan percepatan gravitasi yang sama ke semua objek terlepas dari massanya. Pesawat seberat 1 kg dan 1000 kg akan jatuh dengan kecepatan yang sama. Selain itu, karena landasan bergerak menggunakan manipulasi posisi lewat kode (bukan gaya fisika), massa pesawat yang sangat besar tidak memberikan efek beban atau dorongan ekstra pada landasan tersebut.

**4. Ubah nilai atribut Disabled milik node CollisionShape2D pada scene StonePlatform, lalu coba jalankan scene MainLevel. Apa yang terjadi?**
Jika atribut `Disabled` dicentang (diaktifkan), maka bentuk tabrakan (*hitbox*) dari `StonePlatform` akan dimatikan. Akibatnya, `BlueShip` tidak akan bisa mendarat di atasnya dan akan jatuh tembus melewati landasan tersebut seolah-olah landasannya tidak ada.

**5. Pada scene MainLevel, coba manipulasi atribut Position, Rotation, dan Scale milik node BlueShip secara bebas. Apa yang terjadi pada visualisasi BlueShip di Viewport?**
Visualisasi `BlueShip` di layar (Viewport) akan langsung berubah mengikuti nilai yang dimasukkan. Mengubah `Position` akan menggeser letak pesawat di sumbu X/Y, `Rotation` akan memutar pesawat, dan `Scale` akan mengubah ukuran (memperbesar atau memperkecil) visual pesawat tersebut.

**6. Mengapa nilai Position node StonePlatform dan StonePlatform2 tidak sesuai dengan posisinya di dalam scene (menurut Inspector) namun visualisasinya berada di posisi yang tepat?**
Hal ini terjadi karena konsep **Koordinat Relatif/Lokal** pada hirarki *tree* Godot. Nilai `Position` yang tertera di panel Inspector milik `StonePlatform` adalah posisi *lokal* yang diukur dari titik pusat *Parent Node*-nya (yaitu `PlatformBlue`), bukan dari titik koordinat global layar `MainLevel` (0,0). Karena ia merupakan *child*, posisinya akan selalu mengikuti dan diakumulasikan dengan posisi *parent*-nya, sehingga visualnya tetap berada di tempat yang tepat.


