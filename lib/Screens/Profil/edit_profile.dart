import 'package:flutter/material.dart';
import 'package:tokoecommerce/Screens/profile_page.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
          Container(
          width: ScreenSize.width,
          height: ScreenSize.height*0.3,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 20, 167, 24)
          ),
          child: ProfileWidget(
                name: '',
                email: '',
                profileImage: 'assets/images/kiyotaka.jpg',
              ),
          ),
          SizedBox(height: 10,),         
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey,
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nama'),
                Text('Susanto'),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Alamat'),
                Text('jl.xxxxxxxxxxxxxxxx'),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email'),
                Text('Susanto@email.com'),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Gender'),
                Text('Pria'),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('telephon'),
                Text('085649928xxx'),
              ],
            ),
          ),
        ],
        )
      )
    );
  }
}