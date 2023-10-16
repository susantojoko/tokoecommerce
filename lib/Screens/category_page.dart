import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori',style: TextStyle(color: Colors.blueAccent),),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.blueAccent), // Atur warna ikon panah kembali

        
      ),
        body: Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 5, right: 5),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height- 162,
              child: ListView(children: [
                Column(
                  children: [
                    _buildDataCategory(
                      gambar: 'assets/images/atasan.jpg',
                      label: 'atasan',
                    ),
                    SizedBox(height: 20,),
                    _buildDataCategory(
                      gambar: 'assets/images/atasan.jpg',
                      label: 'atasan',
                    ),
                    SizedBox(height: 20,),
                    _buildDataCategory(
                      gambar: 'assets/images/atasan.jpg',
                      label: 'atasan',
                    ),
                    SizedBox(height: 20,),
                    _buildDataCategory(
                      gambar: 'assets/images/atasan.jpg',
                      label: 'atasan',
                    ),
                    SizedBox(height: 20,),
                    _buildDataCategory(
                      gambar: 'assets/images/atasan.jpg',
                      label: 'atasan',
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}

class _buildDataCategory extends StatelessWidget {
  final String gambar;
  final String label;

  _buildDataCategory({required this.gambar, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(gambar), fit: BoxFit.cover))),
            Text(label),
          ],
        ),
        SizedBox(width: 10,),
        Column(
          children: [
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(gambar), fit: BoxFit.cover))),
            Text(label),
          ],
        ),
        SizedBox(width: 10,),
        Column(
          children: [
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(gambar), fit: BoxFit.cover))),
            Text(label),
          ],
        ),
      ],
    );
  }
}
