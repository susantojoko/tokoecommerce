import 'package:flutter/material.dart';
import 'package:tokoecommerce/Screens/profile_page.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Edit Profil'),
            Icon(Icons.done)
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height * 0.3,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 20, 167, 24),
              ),
              child: ProfileWidget(
                name: '',
                email: '',
                profileImage: 'assets/images/kiyotaka.jpg',
              ),
            ),
            SizedBox(height: 10),
            buildProfileField("Nama", "Susanto"),
            buildProfileField("Alamat", "jl.xxxxxxxxxxxxxxxx"),
            buildProfileField("Email", "Susanto@email.com"),
            buildProfileField("Gender", "Pria"),
            buildProfileField("Telepon", "085649928xxx"),
          ],
        ),
      ),
    );
  }

  Widget buildProfileField(String label, String value) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.grey
            )
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(value),
          ],
        ),
      ),
    );
  }
}
