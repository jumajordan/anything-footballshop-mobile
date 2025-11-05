Nama: Juma Jordan Bimo Simanjuntak
NPM: 2406435843
Kelas: F


## 1. Apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget?
Widget tree adalah **struktur hierarki** dari semua widget yang membentuk antarmuka pengguna (UI) di Flutter.  
Setiap tampilan di Flutter dibangun dari kombinasi widget — mulai dari widget tingkat tinggi seperti `Scaffold` sampai elemen kecil seperti `Text` atau `Icon`.

Hubungan **parent-child** berarti:
- **Parent widget** adalah widget yang membungkus (menampung) widget lain di dalamnya.
- **Child widget** adalah widget yang berada di dalam parent dan menerima konteks, gaya, serta perilaku dari parent-nya.

## 2. Sebutkan semua widget yang digunakan dalam proyek ini dan jelaskan fungsinya
| Widget         | Fungsi                                                                        |
| ---------------| ----------------------------------------------------------------------------- |
| MaterialApp    | Widget root yang menyediakan tema Material Design dan navigasi aplikasi.      |
| Scaffold       | Menyediakan struktur dasar halaman (AppBar, body, FloatingActionButton, dll). |
| AppBar         | Menampilkan bar di bagian atas halaman dengan judul atau tombol.              |
| Padding        | Memberi jarak di sekitar widget anak.                                         |
| Column         | Menyusun widget anak secara vertikal.                                         |
| Row            | Menyusun widget anak secara horizontal.                                       |
| Center         | Menempatkan widget anak di tengah.                                            |
| SizedBox       | Memberi jarak atau ruang kosong dengan ukuran tertentu.                       |
| Card           | Menampilkan elemen berbentuk kartu dengan bayangan.                           |
| Container      | Widget fleksibel untuk mengatur padding, margin, ukuran, dan dekorasi.        |
| Text           | Menampilkan teks.                                                             |
| GridView.count | Menampilkan grid dengan jumlah kolom tetap.                                   |
| Icon           | Menampilkan ikon dari library Material.                                       |
| Material       | Memberi efek visual dan tema Material Design pada elemen UI.                  |
| InkWell        | Memberi efek sentuhan (ripple effect) dan aksi `onTap`.                       |
| SnackBar       | Menampilkan notifikasi sementara di bagian bawah layar.                       |

## 3. Apa fungsi dari widget MaterialApp? Mengapa sering digunakan sebagai widget root?
MaterialApp adalah widget utama yang:
- Mengatur tema, warna, dan gaya global aplikasi.
- Mengatur navigasi antar halaman (routes dan Navigator).
- Menyediakan dukungan Material Design seperti tombol, AppBar, dan animasi bawaan.

## 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

- StatelessWidget: Tidak memiliki state yang dapat berubah. UI hanya bergantung pada data statis atau input dari luar.	

Digunakan saat: Digunakan untuk tampilan yang tidak berubah selama runtime, misalnya Text, Icon, atau halaman statis.

- StatefulWidget: Memiliki state (data internal) yang bisa berubah saat aplikasi berjalan, dan akan memicu rebuild UI saat state berubah.	

Digunakan saat: Digunakan untuk tampilan dinamis, misalnya form input, animasi, atau tombol dengan perubahan kondisi.

## 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang merepresentasikan posisi widget dalam widget tree.
Setiap widget punya BuildContext sendiri, yang dipakai untuk:
- Mengakses data dari widget di atasnya (misalnya Theme.of(context)).
- Melakukan navigasi (Navigator.push(context, ...)).
- Menampilkan widget seperti SnackBar lewat ScaffoldMessenger.of(context).