import 'package:flutter/material.dart';
import 'package:tokoecommerce/authentication/login.dart';
// import '../nav/nav.dart';


class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  bool isObscured = true;
  bool rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size; // Mendapatkan ukuran layar
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background6.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.grey.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    child: Center(child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 30),)),
                    width: screenSize.width > 600 ? 400 : screenSize.width,
                    height: screenSize.height > 800 ? 400 : 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/decoration1.png"),
                        fit: BoxFit.contain,
                        ),
                    ),
                  ),
                  Container(
                    height: screenSize.height >= 800
                        ? 600
                        : 450, // Sesuaikan dengan layar web
                    width: screenSize.width >= 600
                        ? 400
                        : 300, // Sesuaikan dengan layar web
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      border: Border.all(
                        color:
                            Colors.white.withOpacity(0.3), // Warna border transparan
                        width: 1.0, // Lebar border
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.0),
                        _buildTextField(
                          "Username",
                          _usernameController,
                          Icons.person,
                          textFieldWidth: screenSize.width >= 600 ? 360 : 280,
                        ),
                        SizedBox(height: 10),
                        _buildTextField(
                          "Email",
                          _emailController,
                          Icons.email,
                          isPassword: true,
                          textFieldWidth: screenSize.width >= 600 ? 360 : 280,
                        ),
                        SizedBox(height: 10.0),
                        _buildTextField(
                          "Password",
                          _passwordController,
                          Icons.lock,
                          textFieldWidth: screenSize.width >= 600 ? 360 : 280,
                        ),
                        SizedBox(height: 10),
                        _buildTextField(
                          "Confirmation Password",
                          _passwordController2,
                          Icons.lock,
                          isPassword: true,
                          textFieldWidth: screenSize.width >= 600 ? 360 : 280,
                        ),
                        SizedBox(height: 30.0,),
                         _buildSignupButton(context),
                         SizedBox(height: 8.0,),
                        _buildLoginButton(context),
                      ],
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

  Widget _buildTextField(
  String labelText, TextEditingController controller, IconData? prefixIcon,
  {bool isPassword = false, required double textFieldWidth}) {
  return Center(
    child: Container(
      width: textFieldWidth,
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: labelText, // Label teks untuk TextField
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                )
              : null, // Ikona awalan jika ada
          
          // Border yang melengkung dengan borderRadius
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0), // Melengkungkan border
            borderSide: BorderSide(
              color: Colors.blue, // Warna border
              width: 2.0, // Lebar border
            ),
          ),
          
          // Border yang melengkung dengan borderRadius saat dalam fokus
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0), // Melengkungkan border saat dalam fokus
            borderSide: BorderSide(
              color: Colors.blue, // Warna border saat dalam fokus
              width: 2.0, // Lebar border saat dalam fokus
            ),
          ),
          
          // Border yang melengkung dengan borderRadius saat aktif tetapi tidak dalam fokus
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0), // Melengkungkan border saat aktif tetapi tidak dalam fokus
            borderSide: BorderSide(
              color: Colors.grey, // Warna border saat aktif tetapi tidak dalam fokus
              width: 2.0, // Lebar border saat aktif tetapi tidak dalam fokus
            ),
          ),
          labelStyle: TextStyle(
            color: Colors.black, // Warna teks label
          ),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  icon: Icon(
                    isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
              : null,
        ),
        obscureText: isPassword ? isObscured : false,
      ),
    ),
  );
}

  Widget _buildLoginButton(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 60, right: 60),
        child: Row(
          children: [
        Text('have an account?'),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Text("Login"),
        ),
        ],
        ),
      ),
    );
  }
  Widget _buildSignupButton(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
          width: 280,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0XFFBF00FF).withOpacity(0.8), // Set warna latar belakang menjadi transparan
              onPrimary: Colors.blue, // Warna teks tombol saat ditekan
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(14), // Ubah sesuai kebutuhan Anda
                side: BorderSide(
                  color: Colors.blue, // Warna garis tepi tombol
                  width: 1.0, // Lebar garis tepi tombol
                ),
              ),
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.white),
            ),
          ),
      ),
    );

  }

}