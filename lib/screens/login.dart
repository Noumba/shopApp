import 'package:flutter/material.dart';
import 'package:mytech1/screens/product_overview_screens.dart';
import 'package:mytech1/screens/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    final myColor = ColorScheme.fromSwatch(primarySwatch: Colors.purple)
        .secondary
        .withOpacity(1.0);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: height * 0.15, bottom: height * 0.005),
                width: width * 0.5,
                child: Image(
                  image: const AssetImage('asset/shopping.png'),
                  color: myColor,
                ),
              ),
              const FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                      fontFamily: 'sans serif',
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Log in to your existing account of LDV F',
                  style: TextStyle(
                      fontFamily: 'sans serif',
                      fontSize: 16,
                      color: Colors.black26,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                width: width * 0.95,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                    border: Border.all(color: Colors.white)),
                child: TextFormField(
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                  autocorrect: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide.none),
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                width: width * 0.95,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                    border: Border.all(color: Colors.white)),
                child: TextFormField(
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                  autocorrect: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide.none),
                    hintText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Forgot Password?');
                    },
                    child: FittedBox(
                      alignment: Alignment.topRight,
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontFamily: 'sans serif',
                            fontSize: 16,
                            color: myColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 45.0),
                width: double.infinity,
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: ElevatedButton(
                    style: const ButtonStyle(),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ProductsOverviewScreen.routeName);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    )),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.only(top: 30, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                    border: Border.all(color: Colors.white60)),
                child: const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Or connect using',
                    style: TextStyle(
                        fontFamily: 'sans serif',
                        fontSize: 14,
                        color: Colors.black26,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(
                            Size.fromWidth(width * 0.4)),
                        backgroundColor: WidgetStateProperty.all(myColor)),
                    onPressed: () {},
                    icon: Icon(
                      Icons.facebook_outlined,
                      color: Colors.white,
                      size: (IconTheme.of(context).size)! - 4,
                    ),
                    label: const Text(
                      'Facebook',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton.icon(
                    style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(
                            Size.fromWidth(width * 0.4)),
                        backgroundColor:
                            WidgetStateProperty.all(const Color(0xffea4335))),
                    onPressed: () {},
                    icon: Image(
                      color: Colors.white70,
                      image: const AssetImage('asset/search.png'),
                      width: (IconTheme.of(context).size)! - 4,
                      height: (IconTheme.of(context).size)! - 4,
                    ),
                    label: const Text(
                      ' Google ',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontFamily: 'san serif'),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RegisterScreen.routeName);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontFamily: 'times'),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
