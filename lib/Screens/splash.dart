import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  SplashScreen({required this.navigatorKey});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay untuk simulasi tampilan splash screen selama 2 detik
    Future.delayed(Duration(seconds: 2), () {
      // Pindah ke halaman beranda atau halaman utama aplikasi setelah splash screen
      widget.navigatorKey.currentState!.pushReplacementNamed('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.white,
          child: Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                'assets/images/LS_Logo.png', // Ganti dengan path ke file animasi Lottie Anda
                fit: BoxFit.contain,
                width: 200,
                height: 100,
              ),
                  SizedBox(height: 10.0),
                  Text(
                    'Toko Pakaian Lux\'s Store',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}