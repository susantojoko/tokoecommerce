import 'package:flutter/material.dart';
import 'package:tokoecommerce/widget/input_alamat.dart';
import '../data/data.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> newCartItems = List<CartItem>.from(cartItems);
  List<bool> selectedItems = List.generate(cartItems.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    double subtotal = 0.0;
    for (var item in newCartItems) {
      subtotal += item.quantity * item.price;
    }

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
      body: newCartItems.isEmpty
          ? Center(
              child: Text('Keranjang belanja kosong'),
            )
          : ListView.builder(
              itemCount: newCartItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(8), // Padding untuk ListTile
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: selectedItems[index],
                            onChanged: (bool? value) {
                              setState(() {
                                selectedItems[index] = value!; // Perbarui status item yang dipilih
                              });
                            },
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(newCartItems[index].imageUrl),
                          ),
                        ],
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(newCartItems[index].jenis),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline,color:Colors.red, size: 14,),
                                onPressed: () {
                                  setState(() {
                                    if (newCartItems[index].quantity > 1) {
                                      newCartItems[index].quantity--;
                                    }
                                  });
                                },
                              ),
                              Text(newCartItems[index].quantity.toString(),style:TextStyle(fontSize: 14)),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline,color:Colors.green,size: 14,),
                            onPressed: () {
                              setState(() {
                                newCartItems[index].quantity++;
                              });
                            },
                          ),
                          Text('Rp${newCartItems[index].price.toStringAsFixed(2)}'), 
                            ],
                          ),
                         
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
                Text('Rp${subtotal.toStringAsFixed(2)}'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddressForm()));
                // Tambahkan logika untuk melanjutkan ke halaman checkout di sini
              },
              child: Text('Lanjut ke Checkout'),
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
        newCartItems.removeAt(i);
      }
    }
  }
}
