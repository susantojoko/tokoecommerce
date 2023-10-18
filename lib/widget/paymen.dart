import 'package:flutter/material.dart';
import 'package:tokoecommerce/data/data.dart';

class PaymentPage extends StatefulWidget {
  final String imageUrl;
  final String jenis;
  final int quantity;
  final double price;
  final String selectedSize;


  PaymentPage({
    required this.imageUrl,
    required this.jenis,
    required this.quantity,
    required this.price, 
    required this.selectedSize,
  });

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<BeliItem> newBeliItems = List<BeliItem>.from(beliItems);
  String selectedPaymentMethod = ' '; // Metode pembayaran default
  String selectedPaymentMethodWallet = ' '; // Metode pembayaran default
  


  @override
  Widget build(BuildContext context) {
    double subtotal = 0.0;

    for (var item in newBeliItems) {
      subtotal += item.quantity * item.price;
    }

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Alamat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                width: MediaQuery.of(context).size.width - 30,
                child: Column(
                  children: [
                    Text(
                      'Alamat: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Center(
                  child: Text(
                    'ubah',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Text('Produk'),
            Container(
              width: MediaQuery.of(context).size.width-30,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                  ),
                ),
              ),
              child: ListView.builder(
                itemCount: newBeliItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 5),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.imageUrl),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,  
                          children: [
                          Text(widget.jenis),
                          SizedBox(height: 5,),
                          Text('Jumlah ${widget.quantity}'),
                          SizedBox(height: 5,),
                          Text('ukuran ${widget.selectedSize} '),
                          ],),
                          SizedBox(width: 70,),
                          Text('Rp ${widget.price.toStringAsFixed(2)}'),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total :'),
                Text('Rp ${subtotal.toStringAsFixed(2)}'),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Icon(Icons.account_balance_wallet),
                  SizedBox(width: 5,),
                  Text('Credit Cart'),
                  SizedBox(width: 5,),
                  DropdownButton(
              value: selectedPaymentMethod,
              onChanged: (newValue) {
                setState(() {
                  selectedPaymentMethod = newValue.toString();
                });
              },
              items: <String>[
                ' ',
                'Visa',
            'MasterCard',
            'American Express',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
                ],
              ),
            ),

            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Icon(Icons.credit_card),
                  SizedBox(width: 5,),
                  Text('E-Wallet'),
                  SizedBox(width: 5,),
                  DropdownButton(
              value: selectedPaymentMethodWallet,
              onChanged: (newValue) {
                setState(() {
                  selectedPaymentMethodWallet = newValue.toString();
                });
              },
              items: <String>[
                ' ',
                'Dana',
            'OVO',
            'Gopay',
            'Shopeepay',
            'LinkAja'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
                ],
              ),
            ),

            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Credit Card'),
              onTap: () {
                // Tambahkan logika untuk pemilihan kartu kredit
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('e-Wallet'),
              onTap: () {
                // Tambahkan logika untuk pemilihan dompet elektronik
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Payment',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp ${subtotal.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff2a977d),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk melakukan pembayaran
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
