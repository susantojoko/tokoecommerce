import 'package:flutter/material.dart';
import 'package:status_alert/status_alert.dart';
import 'package:tokoecommerce/Screens/cart_page.dart';
import 'package:tokoecommerce/Screens/chat_page.dart';
import 'paymen.dart';
// import '../fucntion/fucntion.dart';
import '../data/data.dart';
import 'description_expanded.dart';

class ProductDetailPage extends StatefulWidget {
  final String imageUrl;
  final String jenis;
  final String warna;
  final double rating;
  final int reviewCount;
  final double price;
  final int stok;

  ProductDetailPage({
    required this.imageUrl,
    required this.jenis,
    required this.warna,
    required this.rating,
    required this.reviewCount,
    required this.price,
    required this.stok,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // Menggunakan List<CartItem> untuk menyimpan item belanja
  int quantity =1;
  bool _favorite = false;

  String selectedSize = 'S';

  void showStatusAlert(BuildContext context) {
    StatusAlert.show(
      context,
      duration: Duration(seconds: 2),
      title: 'Success',
      backgroundColor: Colors.white,
      subtitle: 'Barang berhasil ditambah di favorite',
      configuration: IconConfiguration(icon: Icons.done_outline_outlined, color: Colors.green),
      maxWidth: 260,
    );
  }
  void showStatusAlertcart(BuildContext context) {
    StatusAlert.show(
      context,
      duration: Duration(seconds: 1),
      title: 'Success',
      backgroundColor: Colors.white,
      subtitle: 'Barang berhasil ditambah di Keranjang',
      configuration: IconConfiguration(icon: Icons.done_outline_outlined, color: Colors.green),
      maxWidth: 260,
    );
  }

  // ALERT
  void _showSizeSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        

        return Padding(
          padding: const EdgeInsets.only(top: 400.0),
          child: AlertDialog(
            // title: Text('Pilih Ukuran'),
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.all(0), // Atur padding ke nol
            content: SingleChildScrollView(
              // Gunakan SingleChildScrollView
              child: Container(
                margin: EdgeInsets.all(10),
                height: 200, // Atur lebar sesuai kebutuhan
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: 
                            AssetImage(widget.imageUrl))
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            Text(widget.jenis),
                            SizedBox(height: 5,),
                            Text('${widget.price}'),
                          ],
                        ),
                      SizedBox(width: 30,),
                        DropdownButton<String>(
                      value: selectedSize,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedSize = newValue;
                          });
                        }
                    Navigator.of(context).pop(); // Tutup dialog
                    _showSizeSelectionDialog(); // Tampilkan dialog lagi dengan ukuran yang baru
                
                      },
                      items: <String>['S', 'M', 'L', 'XL']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),

                      ],
                    ),
                    
                    Row(
                      children: [
                        SizedBox(width: 30,),
                        IconButton(
                                icon: Icon(Icons.remove_circle_outline,color:Colors.red, size: 16,),
                                onPressed: () {
                                  setState(() {
                                    if (quantity > 1) {
                                      quantity--;
                                      Navigator.of(context).pop(); // Tutup dialog
                    _showSizeSelectionDialog(); // Tampilkan dialog lagi dengan ukuran yang baru

                                    }
                                  });
                                },
                              ),
                              Text(quantity.toString(),style:TextStyle(fontSize: 16)),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline,color:Colors.green,size: 16,),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                              Navigator.of(context).pop(); // Tutup dialog
                    _showSizeSelectionDialog(); // Tampilkan dialog lagi dengan ukuran yang baru

                            },
                          ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Implementasi logika untuk menambahkan produk ke keranjang belanja
                        // atau melanjutkan ke halaman checkout.
                        BeliItem newBeliItem = BeliItem(
                          widget.imageUrl, widget.jenis, quantity, widget.price, selectedSize);
                      beliItems.add(newBeliItem);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentPage(
                                 imageUrl: widget.imageUrl, 
                                 jenis:widget.jenis,
                                 quantity:quantity, 
                                 price: widget.price,
                                 selectedSize: selectedSize
                                )));
                      },
                      child: Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // void _addData() {
  //   // Membuat objek CartItem dengan data produk yang sedang ditampilkan
  //   CartItem newItem = CartItem(widget.imageUrl, widget.jenis, 1, widget.price);

  //   setState(() {
  //     cartItems.add(newItem);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.jenis),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
                },
                child: Icon(Icons.shopping_cart))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Container(
                width: double.infinity,
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 360,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(widget.imageUrl),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 300,
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Wrap(
                            children: List.generate(3, (index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(widget.imageUrl),
                                        fit: BoxFit.contain)),
                              ));
                        })),
                      ],
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 400,
                    height: 100,
                  ),
                  Positioned(
                    top: 25,
                    left: 250,
                   child: GestureDetector(
  onTap: () {
    setState(() {
      _favorite = !_favorite;
    });
    if (_favorite) {
      // Ketika pengguna menambahkan item ke favorit
      FavoriteItem newItem = FavoriteItem(
        widget.imageUrl, widget.jenis, widget.rating, widget.price, widget.reviewCount);
      favoriteItems.add(newItem);
      showStatusAlert(context);
    } else {
      // Ketika pengguna menghapus item dari favorit
      // Anda dapat menentukan bagaimana item dihapus dari favoriteItems di sini
      // Misalnya, jika Anda ingin menghapus item berdasarkan kriteria tertentu.
      favoriteItems.removeWhere((item) {
        return item.jenis == widget.jenis; // Gantilah dengan kriteria yang sesuai
      });
    }
  },
  child: Container(
    child: _favorite
        ? Icon(
            Icons.favorite,
            size: 40,
            color: Colors.red,
          )
        : Icon(
            Icons.favorite_outline,
            size: 40,
            color: Colors.red,
          ),
  ),
),

                  ),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.jenis,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 5,),
                            Text('Stok : ${widget.stok}'),
                            SizedBox(height: 5,),
                            Text(
                              'Rp ${widget.price}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2a977d),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return Icon(
                                      Icons.star,
                                      size: 12,
                                      color: Colors.orange,
                                    );
                                  }),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '${widget.rating} | ${widget.reviewCount} Terjual',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ])),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              descriptionsExpanded(),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: width - 30,
                  height: height * 0.7,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Colors.black.withOpacity(0.5))),
                  child: ListView(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.5))),
                          ),
                          child: Text('Komentar Produk')),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.greenAccent),
                                    borderRadius: BorderRadius.circular(360)),
                                child: CircleAvatar(
                                    // Properti CircleAvatar disesuaikan sesuai kebutuhan
                                    radius: 30.0, // Radius lingkaran
                                    backgroundColor: Colors
                                        .transparent, // Warna latar belakang lingkaran
                                    // backgroundImage: NetworkImage('https//encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7NGbrqWhWuQcM6vRyD2L6Yg23Wqmjq4tzrg&usqp=CAU'), // Gambar avatar (opsional)
                                    child: Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7NGbrqWhWuQcM6vRyD2L6Yg23Wqmjq4tzrg&usqp=CAU') // Ikon dalam avatar (opsional)
                                    ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 250,
                                height: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Shinigami'),
                                    Wrap(
                                        children: List.generate(5, (index) {
                                      return Icon(
                                        Icons.star,
                                        size: 10,
                                        color: Colors.yellow,
                                      );
                                    })),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.greenAccent),
                                    borderRadius: BorderRadius.circular(360)),
                                child: CircleAvatar(

                                    // Properti CircleAvatar disesuaikan sesuai kebutuhan
                                    radius: 30.0, // Radius lingkaran
                                    backgroundColor: Colors
                                        .transparent, // Warna latar belakang lingkaran
                                    // backgroundImage: NetworkImage('https//encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7NGbrqWhWuQcM6vRyD2L6Yg23Wqmjq4tzrg&usqp=CAU'), // Gambar avatar (opsional)
                                    child: Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6fJKvod-zZv5zoMTNDFu5FYy0Ei1DxhWezA&usqp=CAU') // Ikon dalam avatar (opsional)
                                    ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 250,
                                height: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Ryuen'),
                                    Wrap(
                                        children: List.generate(5, (index) {
                                      return Icon(
                                        Icons.star,
                                        size: 10,
                                        color: Colors.yellow,
                                      );
                                    })),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(productName: widget.jenis,)));
                    },
                    icon: Icon(
                      Icons.chat,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      CartItem newItem = CartItem(
                          widget.imageUrl, widget.jenis, 1, widget.price);
                      cartItems.add(newItem);
                      showStatusAlertcart(context);
                    },
                    icon: Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 5, right: 5),
              width: MediaQuery.of(context).size.width / 2 - 10,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 197, 255, 82),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: MaterialButton(
                    onPressed: () {
                      _showSizeSelectionDialog();
                      
                    },
                    child: Text('Beli Sekarang'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Tambahkan logika untuk menampilkan keranjang belanja di sini
      //     _showCartDialog();
      //   },
      //   child: Icon(Icons.shopping_cart),
      // ),
    );
  }

  // Metode untuk menampilkan dialog keranjang belanja
//   void _showCartDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Keranjang Belanja'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: cartItems.map((item) {
//               return ListTile(
//                 title: Text(item.jenis),
//                 subtitle: Text(
//                   'Quantity: ${item.quantity}, Price: \$${item.price.toStringAsFixed(2)}',
//                 ),
//               );
//             }).toList(),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Tutup'),
//             ),
//           ],
//         );
//       },
//     );
//   }
}
