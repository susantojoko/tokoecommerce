import 'package:flutter/material.dart';
import 'package:tokoecommerce/authentication/login.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/forgotPass.png"),
                  fit: BoxFit.cover,
                  ),
                )
              ),
              SizedBox(height: 10,),
              Text('Enter Your Email',style: TextStyle(fontSize: 12),),
              SizedBox(height: 10,),
              Container(
                width: 250,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                  ),
                )),
              SizedBox(height: 10,),
              _buildForgotButton(context),
          
            ],
          ) ,
        ),
    );
  }

   Widget _buildForgotButton(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 40),
        height: 50,
        width: 200,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
            // Navigator.pushNamed(context, '/signup');
          },
          child: Text("Send", style: TextStyle(fontSize: 14),),
        ),
        ),
    );
  }

}