import 'package:flutter/material.dart';

class PusatBantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pusat Bantuan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat datang di Pusat Bantuan E-Commerce!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Apakah Anda memiliki pertanyaan atau masalah terkait dengan aplikasi kami? Kami siap membantu Anda!',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk mengarahkan pengguna ke halaman FAQ atau form kontak bantuan.
                // Misalnya, menggunakan Navigator untuk berpindah ke halaman FAQ.
                Navigator.push(context, MaterialPageRoute(builder: (context) => FAQPage()));
              },
              child: Text('FAQ'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk mengarahkan pengguna ke halaman kontak bantuan atau formulir kontak.
                // Misalnya, menggunakan Navigator untuk berpindah ke halaman kontak bantuan.
                Navigator.push(context, MaterialPageRoute(builder: (context) => KontakBantuanPage()));
              },
              child: Text('Hubungi Kami'),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Tampilkan daftar pertanyaan yang sering diajukan (FAQ) dan jawabannya di sini.
    return Scaffold(
      appBar: AppBar(
        title: Text('Pusat Bantuan - FAQ'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Apa cara memesan produk?'),
            subtitle: Text('Anda dapat memesan produk dengan mengklik tombol "Beli" di halaman produk yang diinginkan.'),
          ),
          ListTile(
            title: Text('Bagaimana cara melacak pesanan saya?'),
            subtitle: Text('Anda dapat melacak pesanan Anda dengan masuk ke akun Anda dan mengunjungi halaman "Pesanan Saya".'),
          ),
          // Tambahkan daftar pertanyaan dan jawaban lainnya di sini.
        ],
      ),
    );
  }
}

class KontakBantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Tampilkan formulir kontak atau informasi kontak layanan pelanggan di sini.
    return Scaffold(
      appBar: AppBar(
        title: Text('Hubungi Kami'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Jika Anda memiliki pertanyaan atau masalah, jangan ragu untuk menghubungi kami.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            // Tambahkan formulir kontak atau informasi kontak layanan pelanggan di sini.
          ],
        ),
      ),
    );
  }
}
