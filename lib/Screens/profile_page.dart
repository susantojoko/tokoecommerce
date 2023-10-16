import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    return Scaffold( 
    body: Stack(
      children: [
        Container(
        width: ScreenSize.width,
        height: ScreenSize.height,
        child: Column(
          children: [
            Center(
              child: ProfileWidget(
                name: 'Apa Kabar Brother',
                email: 'johndoe@example.com',
                profileImage: 'assets/images/kiyotaka.jpg',
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 330,
        child: Container(
        width: ScreenSize.width,
        height: 400,
        child: Column(
          children: [
            MenuProfile3(label: 'Pengaturan akun',icon: Icons.person,),
            MenuProfile3(label: 'Pusat Bantuan',icon: Icons.question_mark,),
            MenuProfile3(label: 'Kebijakan Privasi',icon: Icons.info,),
            MenuProfile3(label: 'Beri reting',icon: Icons.thumb_up,),
            SizedBox(height: 30,),
            MenuProfile3(label: 'Beri reting',icon: Icons.logout,),
          ],

        ),
      )),
      Positioned(
        left: 25,
        right: 25,
        top: 220,
        child: Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 38, 181, 191),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Container(
                            width: 50,
                            height: 50,
                             child: Column(
                               children: [
                                 Image.asset('assets/icons/service.png'),
                                 Text('Service', style: TextStyle(fontSize: 10,))
                               ],
                             ),
                           ),
                           Container(
                            width: 50,
                            height: 50,
                             child: Column(
                               children: [
                                 Image.asset('assets/icons/iconDikirim.png'),
                                 Text('Dikirim', style: TextStyle(fontSize: 10,))
                               ],
                             ),
                           ),
                        MenuProfile(icon: Icons.favorite, label: 'favorite'),
                        Container(
                            width: 50,
                            height: 50,
                             child: Column(
                               children: [
                                 Image.asset('assets/icons/iconDiterima.png'),
                                 Text('Diterima', style: TextStyle(fontSize: 10,))
                               ],
                             ),
                           ),
                      ],
                    ),
                  ),
                ),
      ),

      ],
    ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String name;
  final String email;
  final String profileImage;

  ProfileWidget({
    required this.name,
    required this.email,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 250,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 32, 164, 67),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15,),
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(profileImage,),
              // child: Image.network(profileImage),
            ),
            SizedBox(height: 12),
            Text(
              name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              email,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 5),
            
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk mengedit profil di sini
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Color(0xffBF00FF),
              ),
              child: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuProfile extends StatelessWidget {
  final IconData? icon;
  final String label;

  MenuProfile({this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Text(label),
      ],
    );
  }
}
class MenuProfile3 extends StatelessWidget {
  final IconData? icon;
  final String label;

  MenuProfile3({this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white, 
        border: Border.all(
          width: 1,
        )
      ),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Icon(icon),
          SizedBox(width: 20,),
          Text(label),
        ],
      ),
    );
  }
}