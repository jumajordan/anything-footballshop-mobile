Nama: Juma Jordan Bimo Simanjuntak
NPM: 2406435843
Kelas: F


## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

### `Navigator.push()`
- Menambahkan (mendorong) halaman baru ke atas *navigation stack*.
- Halaman sebelumnya tetap ada di bawahnya, sehingga pengguna bisa kembali dengan tombol "Back".
- Cocok digunakan untuk transisi normal antar-halaman, misalnya:
  - Dari halaman daftar produk ke halaman detail produk.
  - Dari menu utama ke form tambah produk.

### `Navigator.pushReplacement()`
- Mengganti halaman saat ini dengan halaman baru di *navigation stack*.
- Halaman sebelumnya dihapus, jadi pengguna tidak bisa kembali ke sana.
- Cocok digunakan untuk skenario seperti:
  - Setelah login, mengganti halaman login dengan halaman beranda (supaya user tidak bisa kembali ke login).
  - Setelah menambahkan produk berhasil, mengganti halaman form dengan halaman daftar produk.

## 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Struktur dasar setiap halaman di aplikasi ini menggunakan kombinasi widget Flutter utama berikut:

### `Scaffold`
- Menjadi kerangka utama untuk setiap halaman.
- Menyediakan area standar untuk `AppBar`, `Drawer`, `body`, dan `FloatingActionButton`.

### `AppBar`
- Menampilkan judul halaman dan ikon navigasi.
- Memberikan konsistensi di seluruh aplikasi.

### `Drawer`
- Berisi menu navigasi ke berbagai halaman (Home, Tambah Produk, Tentang Aplikasi).
- Membuat navigasi antar-halaman lebih mudah dan seragam.

## 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

### `Padding`
- Memberikan ruang di sekitar widget agar tampilan tidak terlalu rapat.
Contoh: Menambahkan padding di sekitar TextFormField pada form produk.

### `SingleChildScrollView`
- Membuat konten halaman bisa digulir ke bawah (scroll) saat banyak elemen form.
- Mencegah overflow error saat keyboard muncul di layar kecil.

### `ListView`
- Digunakan untuk menampilkan daftar produk yang dinamis dan bisa di-scroll.
- Cocok untuk menampilkan banyak data seperti katalog produk.

## 4.  Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Untuk menjaga konsistensi visual, aplikasi Football Shop menggunakan tema global yang ditentukan melalui ThemeData di MaterialApp. Warna hijau dipilih karena identik dengan lapangan sepak bola, sehingga menciptakan identitas visual kuat dan konsisten di seluruh aplikasi.