import 'package:flutter/material.dart';

class BeriRatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beri Rating'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Berikan Rating',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pilih Produk atau Layanan yang Ingin Anda Beri Rating:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Tambahkan daftar produk atau layanan yang dapat diberi rating
            ListTile(
              title: Text('Produk A'),
              leading: Radio(value: 'Produk A', groupValue: 'rating_item', onChanged: (value) {}),
            ),
            ListTile(
              title: Text('Produk B'),
              leading: Radio(value: 'Produk B', groupValue: 'rating_item', onChanged: (value) {}),
            ),
            SizedBox(height: 20),
            Text(
              'Berikan Rating:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Tambahkan kontrol rating, misalnya, dengan menggunakan RatingBar
            // (Anda mungkin perlu mengimpor package untuk RatingBar)
            // RatingBar(
            //   initialRating: 0,
            //   minRating: 1,
            //   direction: Axis.horizontal,
            //   allowHalfRating: false,
            //   itemCount: 5,
            //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            //   itemBuilder: (context, _) => Icon(
            //     Icons.star,
            //     color: Colors.amber,
            //   ),
            //   onRatingUpdate: (rating) {
            //     // Lakukan sesuatu dengan rating yang diberikan oleh pengguna
            //   },
            // ),
            SizedBox(height: 20),
            Text(
              'Komentar (Opsional):',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Tambahkan input teks untuk komentar pengguna
            // TextField(
            //   maxLines: 5,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lakukan sesuatu saat pengguna menekan tombol "Submit Rating"
              },
              child: Text('Submit Rating'),
            ),
          ],
        ),
      ),
    );
  }
}
