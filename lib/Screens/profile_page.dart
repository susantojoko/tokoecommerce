import 'package:flutter/material.dart';
import 'package:tokoecommerce/Screens/Profil/edit_profile.dart';
import 'package:tokoecommerce/Screens/Profil/pesanan.dart';
import 'package:tokoecommerce/Screens/Profil/bantuan.dart';
import 'package:tokoecommerce/Screens/Profil/berireting.dart';
import 'package:tokoecommerce/Screens/Profil/kebijakandanprivasi.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _navigateToOrdersTab(int tabIndex) {
    // Gunakan Navigator untuk berpindah ke halaman pesanan dan mengaktifkan tab yang sesuai
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PesananPage(initialTabIndex: tabIndex),
      ),
    );
  }
   void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Logout'),
          content: Text('Apakah Anda yakin ingin logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Tambahkan logika logout di sini (bersihkan sesi, hapus token, dll.)
                _performLogout(context);
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _performLogout(BuildContext context) {
    // Tambahkan logika logout di sini
    // Misalnya, bersihkan sesi, hapus token, dll.
    // Setelah logout, arahkan pengguna kembali ke halaman login atau halaman awal aplikasi.
    // Anda dapat menggunakan Navigator untuk melakukan navigasi.
    // Contoh:
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }


  @override
  Widget build(BuildContext context) {
    final Uri WhatApp = Uri.parse('https://wa.me/6285649928040');
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
                  MenuProfile3(
                    label: 'Pengaturan akun',
                    icon: Icons.person,
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => EditProfile()));
                    },
                  ),
                  MenuProfile3(label: 'Pusat Bantuan', icon: Icons.question_mark,
                  onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PusatBantuanPage()));
                    },),
                  MenuProfile3(label: 'Kebijakan Privasi', icon: Icons.info,
                  onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => KebijakanPrivasiPage()));
                    },),
                  MenuProfile3(label: 'Beri reting', icon: Icons.thumb_up,
                  onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => BeriRatingPage()));
                    },),
                  SizedBox(height: 30),
                  MenuProfile3(label: 'Logout', icon: Icons.logout,
                  // onTap: () {
                  //     Navigator.push(
                  //         context, MaterialPageRoute(builder: (context) => EditProfile()));
                  //   },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 25,
            right: 25,
            top: 220,
            child: Container(
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 38, 181, 191),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: InkWell(
                        onTap: () {
                          launchUrl(WhatApp);
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/icons/service.png'),
                            Text('Service', style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                         onTap: () {
                          _navigateToOrdersTab(0);
                         },
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Column(
                          children: [
                            Image.asset('assets/icons/iconDikirim.png'),
                            Text('Dikirim', style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                    ),
                    MenuProfile(icon: Icons.favorite, label: 'favorite'),
                    InkWell(
                      onTap:(){
                        _navigateToOrdersTab(1);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Column(
                          children: [
                            Image.asset('assets/icons/iconDiterima.png'),
                            Text('Diterima', style: TextStyle(fontSize: 10)),
                          ],
                        ),
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
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 250,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 32, 69, 164),
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
            SizedBox(height: 15),
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(profileImage),
            ),
            SizedBox(height: 12),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              email,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class MenuProfile extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback? onTap;

  MenuProfile({this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon),
          Text(label),
        ],
      ),
    );
  }
}

class MenuProfile3 extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback? onTap;

  MenuProfile3({this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 400,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Icon(icon),
            SizedBox(width: 20),
            Text(label),
          ],
        ),
      ),
    );
  }
}
