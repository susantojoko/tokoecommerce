import 'package:flutter/material.dart';

class KebijakanPrivasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kebijakan Privasi'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kebijakan Privasi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Versi 1.0 (Terakhir diperbarui pada 1 Januari 2023)',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pengumpulan dan Penggunaan Informasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Kami mengumpulkan informasi yang Anda berikan, seperti nama, alamat, nomor telepon, alamat email, dan informasi lain yang diperlukan untuk memproses pesanan Anda dan memberikan layanan pelanggan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Keamanan Data',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Kami bertanggung jawab atas keamanan informasi Anda. Kami mengambil langkah-langkah yang diperlukan untuk melindungi data Anda dari akses yang tidak sah atau penyalahgunaan.',
              style: TextStyle(fontSize: 16),
            ),
            // Tambahkan informasi kebijakan privasi lainnya sesuai kebutuhan.
          ],
        ),
      ),
    );
  }
}
