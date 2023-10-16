import 'package:flutter/material.dart';
import 'package:tokoecommerce/authentication/signup.dart';
import 'package:tokoecommerce/nav/navbar_bottom.dart';
import 'forgot.dart';
// import '../nav/nav.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                    child: Center(child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 30),)),
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
                        ? 400
                        : 380, // Sesuaikan dengan layar web
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
                        SizedBox(height: 40.0),
                        _buildTextField(
                          "Email",
                          _emailController,
                          Icons.email,
                          textFieldWidth: screenSize.width >= 600 ? 360 : 280,
                        ),
                        SizedBox(height: 10),
                        _buildTextField(
                          "Password",
                          _passwordController,
                          Icons.lock,
                          isPassword: true,
                          textFieldWidth: screenSize.width >= 600 ? 360 : 280,
                        ),
                        SizedBox(height: 5.0),
                        _buildForgotPasswordButton(context),
                        SizedBox(height: 10.0),
                        _buildLoginButton(context),
                        SizedBox(height: 10,),
                        _buildSignUpButton(context)
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


  Widget _buildForgotPasswordButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(children: [
        Checkbox(value: rememberMe, onChanged: (newValue){
          setState(()
          {
            rememberMe = newValue!;
          });
        },
        shape: CircleBorder(),
        ),
        Text("Remember Me", style: TextStyle(fontSize: 12),),
        SizedBox(width: 40,),
         
         TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForgotPassword()));
        },
        child: Text("Forgot Password", style: TextStyle(fontSize: 12),),
      ),

      ],),
      
     
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 260,
        //     decoration: BoxDecoration(
        //       color: Colors.black.withOpacity(0.1),
        //       borderRadius: BorderRadius.circular(30),
        //       border: Border.all(
        //       color: Colors.white.withOpacity(0.1), // Warna border putih dengan opasitas (transparan)
        //       width: 2.0, // Lebar border
        // ),
        //     ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NavBarBottom()));
            
            // _signIn(context);
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
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 40),
        child: Row(
          children: [
        Text('don\'t have account? '),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
            // Navigator.pushNamed(context, '/signup');
          },
          child: Text("Sign Up"),
        ),
        ],
        ),
      ),
    );
  }

}