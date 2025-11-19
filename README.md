Nama: Juma Jordan Bimo Simanjuntak
NPM: 2406435843
Kelas: F

### 1. Mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic>?
Kita perlu membuat model Dart untuk mengubah data mentah (JSON/Map) menjadi objek yang terstruktur dan bertipe kuat (strongly-typed).

Manfaat: Membantu type safety (mencegah error tipe data saat kompilasi), autocompletion di IDE, dan struktur kode yang lebih rapi.

Konsekuensi tanpa model:

Validasi Tipe: Kita tidak tahu apakah suatu field itu int atau String sampai runtime, yang rentan crash.

Null-safety: Sulit menangani nilai null secara konsisten.

Maintainability: Kode menjadi sulit dibaca dan dikelola karena kita harus mengakses data dengan string key manual (contoh: data['fields']['price']) yang rawan typo.

### 2. Apa fungsi package http dan CookieRequest? Perbedaan perannya?
http: Package dasar Flutter untuk melakukan permintaan HTTP (GET, POST, dll.) ke server. Ini digunakan untuk komunikasi jaringan standar.

CookieRequest (dari pbp_django_auth): Wrapper atau kelas khusus yang dirancang untuk menangani sesi dan autentikasi dengan Django.

Perbedaan: http bersifat stateless (tidak menyimpan sesi/cookie antar request secara otomatis), sedangkan CookieRequest secara otomatis menyimpan dan menyertakan cookies (seperti sessionid dan csrftoken) di setiap permintaan. Ini sangat krusial untuk mengakses halaman yang butuh login di Django.

### 3. Mengapa instance CookieRequest perlu dibagikan ke semua komponen?
Agar status login (sesi) pengguna konsisten di seluruh aplikasi. Jika setiap halaman membuat instance CookieRequest baru, maka sesi login akan hilang karena cookies tidak tersimpan antar halaman. Dengan membagikannya (menggunakan Provider), semua widget mengakses objek sesi yang sama.

### 4. Jelaskan konfigurasi konektivitas (10.0.2.2, CORS, ALLOWED_HOSTS, Internet Perms).
10.0.2.2: Ini adalah alamat IP khusus yang digunakan oleh Android Emulator untuk mengakses localhost komputer host. Emulator menganggap localhost (127.0.0.1) sebagai dirinya sendiri.

ALLOWED_HOSTS: Django memblokir host yang tidak dikenal demi keamanan. Kita harus menambahkan 10.0.2.2 agar Django menerima request dari emulator.

CORS (Cross-Origin Resource Sharing): Mengizinkan browser/aplikasi dari domain berbeda (Flutter app dianggap berbeda origin) untuk mengakses resource server.

Internet Permission (AndroidManifest.xml): Android secara default memblokir akses internet aplikasi. Kita harus menambahkan <uses-permission android:name="android.permission.INTERNET" /> agar aplikasi bisa mengirim request.

Jika tidak dikonfigurasi: Aplikasi Flutter akan mengalami error koneksi (misal SocketException atau 403 Forbidden) dan tidak bisa mengambil data dari server.

### 5. Jelaskan mekanisme pengiriman data (Input -> Tampil).
`Input:` Pengguna memasukkan data di form Flutter.
`Serialisasi:` Data input diubah menjadi format JSON.
`Request:` Flutter (via CookieRequest) mengirim HTTP POST request membawa JSON tersebut ke endpoint Django.
`Processing` (Django): Django menerima request, memvalidasi data, dan menyimpannya ke database.
`Fetching:` Untuk menampilkan, Flutter mengirim HTTP GET request ke endpoint JSON Django.
`Deserialisasi:` Flutter menerima respon JSON, lalu mengubahnya menjadi objek Dart (Model).
`Display:` Data objek ditampilkan ke UI menggunakan widget seperti ListView atau Text.

### 6. Jelaskan mekanisme autentikasi (Login -> Logout).
`Login:`
- User input username/password di Flutter.
- CookieRequest.login() mengirim kredensial ke endpoint Django /auth/login/.
- Django memverifikasi (autentikasi). Jika valid, Django membuat session dan mengembalikan cookie sessionid.
- CookieRequest menyimpan cookie ini.
- Flutter mengubah tampilan ke halaman utama (Menu).

`Sesi:` Setiap request berikutnya (misal ambil daftar produk) akan menyertakan cookie sessionid tersebut, sehingga Django tahu user mana yang sedang aktif.

`Logout:`
- User menekan tombol logout.
- CookieRequest.logout() memanggil endpoint /auth/logout/.
- Django menghapus sesi di server.
- CookieRequest menghapus cookie lokal.
- Flutter mengarahkan kembali ke halaman Login.

### 7. Implementasi Step-by-Step Checklist
1. `Setup: Menambahkan dependensi provider, pbp_django_auth, http di pubspec.yaml.`
2. `Model: Membuat product.dart berdasarkan struktur JSON Django (fields: name, price, etc.).`
3. `Auth:`
    - Membuat login.dart dan register.dart menggunakan widget Form dan CookieRequest untuk komunikasi ke API Django (/login/, /register/).
    - Mengatur main.dart menggunakan Provider untuk CookieRequest.

4. `Product List:`
    - Membuat list_product.dart dengan FutureBuilder yang memanggil endpoint JSON Django.
    - Melakukan parsing JSON ke list objek Product.
    - Menampilkan data dalam ListView.

5. `Detail Page:`
    - Membuat detail_product.dart yang menerima parameter objek Product.
    - Menampilkan seluruh atribut produk dan tombol kembali (Navigator.pop).

6. `Navigasi:`
    - Menambahkan menu "Login", "Register", "Logout" di menu.dart dan left_drawer.dart.
    - Menghubungkan "Daftar Produk" ke list_product.dart.