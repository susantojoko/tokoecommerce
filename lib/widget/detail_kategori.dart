import 'package:flutter/material.dart';
import 'package:tokoecommerce/widget/detail_produk.dart';
import '../data/data.dart';


class DetailCategory extends StatefulWidget {
  const DetailCategory({super.key});

  @override
  State<DetailCategory> createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Populer'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildProductRow(context), // Pass BuildContext to this function
                  buildProductRow(context), // Pass BuildContext to this function
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }

  Widget buildProductRow(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: pakaian.map(
        (product) {
          return buildProductItem(
            product['imageUrl'],
            product['jenis'],
            product['stok'],
            product['warna'],
            product['rating'],
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
    int stok,
    String warna,
    double rating,
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
              stok: stok,
              warna: warna,
              rating: rating,
              reviewCount: reviewCount,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        height: 160,
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
                      color: const Color.fromARGB(255, 13, 12, 12),
                    ),
                  ),
                  SizedBox(height: 2),
                  // Text(
                  //   warna,
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  // SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.orange,
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
}
