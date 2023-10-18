import 'package:flutter/material.dart';
import 'package:tokoecommerce/widget/paymen.dart';

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _zipCodeController = TextEditingController();
  TextEditingController _streetController = TextEditingController();

  bool addressIsHome = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alamat Pengiriman'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Kontak'),
              SizedBox(height: 10),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                ),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'No. Telepon',
                ),
              ),
              SizedBox(height: 10),
              Text('Alamat'),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  hintText: 'Desa, Kecamatan, Kota, Provinsi',
                ),
              ),
              TextField(
                controller: _zipCodeController,
                decoration: InputDecoration(
                  labelText: 'Kode Pos',
                ),
              ),
              TextField(
                controller: _streetController,
                decoration: InputDecoration(
                  labelText: 'Nama Jalan',
                ),
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text('Atur sebagai alamat rumah'),
                value: addressIsHome,
                onChanged: (bool? newValue) {
                  setState(() {
                    addressIsHome = newValue ?? false;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Mengambil alamat dari controller
                  String name = _nameController.text;
                  String phone = _phoneController.text;
                  String address = _addressController.text;
                  String zipCode = _zipCodeController.text;
                  String street = _streetController.text;
      
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(imageUrl: '',quantity: 1,jenis: '',price: 1, selectedSize: '',),));
                  // Melakukan sesuatu dengan data alamat, seperti menyimpannya atau mengirimnya
                  // Contoh: mencetak alamat ke konsol
                  print('Nama: $name');
                  print('No. Telepon: $phone');
                  print('Alamat: $address');
                  print('Kode Pos: $zipCode');
                  print('Nama Jalan: $street');
                  print('Alamat rumah: $addressIsHome');
                },
                child: Text('Simpan Alamat'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _zipCodeController.dispose();
    _streetController.dispose();
    super.dispose();
  }
}
