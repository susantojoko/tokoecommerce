import 'package:flutter/material.dart';
import '../data/data.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final List<FavoriteItem> newFavoriteItems = List<FavoriteItem>.from(favoriteItems);
  List<bool> selectedItems = List.generate(favoriteItems.length, (index) => false);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Belanja'),
        actions: [
          IconButton(
            onPressed: () {
              _deleteSelectedItems(); // Panggil fungsi untuk menghapus item yang dipilih
            },
            icon: Icon(Icons.delete), // Icon untuk menghapus item terpilih
          )
        ],
      ),
      body: newFavoriteItems.isEmpty
          ? Center(
              child: Text('Favorite kosong'),
            )
          : ListView.builder(
              itemCount: newFavoriteItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(8), // Padding untuk ListTile
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          
                          CircleAvatar(
                            backgroundImage: AssetImage(newFavoriteItems[index].imageUrl),
                          ),
                        ],
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(newFavoriteItems[index].jenis),
                          
                         
                        ],
                      ),
                     
                    ),
                  ],
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total :'),
              
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menghapus item yang dipilih
  void _deleteSelectedItems() {
    for (int i = selectedItems.length - 1; i >= 0; i--) {
      if (selectedItems[i]) {
        selectedItems.removeAt(i);
        newFavoriteItems.removeAt(i);
      }
    }
  }
}
