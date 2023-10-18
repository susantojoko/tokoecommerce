import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tokoecommerce/Screens/cart_page.dart';
import 'package:tokoecommerce/widget/detail_kategori.dart';
import 'package:tokoecommerce/widget/detail_produk.dart';
import 'package:tokoecommerce/Screens/category_page.dart';
import '../data/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 160;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print('print value'+ _currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffBF00FF),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 30),
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText:
                              'Cari produk', // Placeholder dalam TextField
                          prefixIcon: Icon(Icons.search), // Ikona pencarian
                          enabledBorder: InputBorder.none,
                          // Border luar TextField
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()));
                        },
                        child: Icon(Icons.shopping_cart),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ) // Ikona keranjang
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                  ),
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: 5,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position);
                      }),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: DotsIndicator(
                      dotsCount: 5,
                      position: _currPageValue.round(),
                      decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 90,
                  width: ScreenSize.width >= 600 ? 800 : ScreenSize.width,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff765827)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MenuCategory(icon: Icons.star, label: 'Popular'),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.brown.withOpacity(0.5),
                                  )),
                              child: Column(
                                children: [
                                  Image.asset('assets/icons/iconBaju.png'),
                                  Text('Baju',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailCategory()));
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.brown.withOpacity(0.5),
                                    )),
                                child: Column(
                                  children: [
                                    Image.asset('assets/icons/iconCelana.png'),
                                    Text('Celana',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            MenuCategory(
                                icon: Icons.dashboard_customize_rounded,
                                label: 'Other'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Produk Populer'),
        SizedBox(height: 10),
        // Bungkus daftar produk populer dalam ListView horizontal
        Container(
          height: 150, // Sesuaikan tinggi sesuai kebutuhan Anda
          child: ListView(
            scrollDirection: Axis.horizontal, // Mengaktifkan pengguliran horizontal
            children: pakaian.map((product) {
              return buildProductItem(
                product['imageUrl'],
                product['jenis'],
                product['warna'],
                product['rating'],
                product['stok'],
                product['reviewCount'],
                product['price'],
                context,
              );
            }).toList(),
          ),
        ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 3,
                ),
                Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Produk'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildProductRow(
                                  context), // Pass BuildContext to this function
                              buildProductRow(
                                  context), // Pass BuildContext to this function
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
           Container(
            height: 170,
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('assets/images/kemejak.png'),
                    fit: BoxFit.cover),
                    boxShadow: [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]
                    ),
          ),
        ],
      ),
    );
  }
}

class MenuCategory extends StatelessWidget {
  final IconData? icon;
  final String label;

  MenuCategory({this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CategoryPage()));
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.brown,
              width: 0.5,
            )),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 32,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildProductRow(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: pakaian.map(
      (product) {
        return buildProductItem(
          product['imageUrl'],
          product['jenis'],
          product['warna'],
          product['rating'],
          product['stok'],
          product['reviewCount'],
          product['price'],
          context,
        );
      },
    ).toList(),
  );
}
Widget buildProductPopuler(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: pakaian.map(
      (product) {
        return buildProductItem(
          product['imageUrl'],
          product['jenis'],
          product['warna'],
          product['rating'],
          product['stok'],
          product['reviewCount'],
          product['price'],
          context,
        );
      },
    ).toList(),
  );
}

//datanya
Widget buildProductItem(
  String imageUrl,
  String jenis,
  String warna,
  double rating,
  int stok,
  int reviewCount,
  double price,
  BuildContext context, // Tambahkan parameter BuildContext
) {
  return GestureDetector(
    onTap: () {
      // Navigasi ke halaman detail produk saat gambar produk diklik
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProductDetailPage(
            imageUrl: imageUrl,
            jenis: jenis,
            stok:stok,
            warna: warna,
            rating: rating,
            reviewCount: reviewCount,
            price: price,
          ),
        ),
      );
    },
    child: Container(
      height: 150,
      width: 160,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 164, 153, 153),
              blurRadius: 4,
              offset: Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jenis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 12,
                        );
                      }),
                    ),
                    SizedBox(width: 3),
                    Text(
                      '$rating | $reviewCount',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                Text(
                  'Rp $price',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2a977d),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
