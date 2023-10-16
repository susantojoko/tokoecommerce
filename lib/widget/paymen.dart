import 'package:flutter/material.dart';


class PaymentPage extends StatefulWidget {
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool barang1=false;
  @override
  Widget build(BuildContext context) {
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
                  border: Border.all(
                    width: 1
                  )
                ),
                width: MediaQuery.of(context).size.width-30,
                child: Column(children: [
                  Text('alamat: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'),
                ]),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width-30,
                decoration: BoxDecoration(
                  
                  border: Border.all(
                    width: 1
                  )
                ),
                child: Center(child: Text('ubah',style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(height: 32),
            Text('Produk'),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                  )
                )
              ),
              child: Column(children: [
                Row(children: [
                  Checkbox(value: barang1, onChanged: (newBarang){
                    setState(()
                    {
                      barang1 = newBarang!;
                    }
                    );
                  }),
                  SizedBox( width: 5,),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assetName'),
                      )
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: Image.asset('name')),
                  SizedBox(width: 50,),
                  Text('Rp1000000')
                ],)
              ]),
            ),
            SizedBox(height: 32),
            Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
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
                  'Rp 1.500.000',
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
