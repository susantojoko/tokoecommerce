import 'package:flutter/material.dart';

class PesananPage extends StatelessWidget {
  final int initialTabIndex;

  PesananPage({required this.initialTabIndex});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
       length: 2,
      initialIndex: initialTabIndex, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pesanan'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Dikirim'),
              Tab(text: 'Terkirim'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Halaman "Dikirim"
            OrdersList(status: 'Dikirim'),

            // Halaman "Terkirim"
            OrdersList(status: 'Terkirim'),
          ],
        ),
      ),
    );
  }
}

class OrdersList extends StatelessWidget {
  final String status;

  OrdersList({required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Ganti dengan path gambar latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pesanan $status',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // Tambahkan tampilan pesanan berdasarkan status (Dikirim atau Terkirim)
            ],
          ),
        ),
      ),
    );
  }
}
