import 'package:ecommerce_app_demo/src/config/constants.dart';
import 'package:ecommerce_app_demo/src/config/ktext.dart';
import 'package:ecommerce_app_demo/src/config/size_maintains.dart';
import 'package:ecommerce_app_demo/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Get.to(HomePage());
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body:SingleChildScrollView (
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: respectiveWidth(size, 30),
            vertical: respectiveHeight(size, 40),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/user/login-bg.png',
                  fit: BoxFit.cover,
                  width: 300,
                ),
                SizedBox(
                  height: respectiveHeight(size, 30),
                ),
                KText(
                  text: 'Welcome',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: respectiveHeight(size, 50),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter email',
                       labelText: 'Email',
                      
                      ),
                      validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot be empty";
                            }
                          return null;
                      }
                      
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Enter password', labelText: 'Password'),
                      validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password length should be atleast 6";
                            }
                            return null;
                      }
              
                ),
            
              
                SizedBox(
                  height: respectiveHeight(size, 30),
                ),
                Material(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                    ),
                  ),
                ),
              ]
            )
          ),
        ),
      ),
    );
    
  }
}
