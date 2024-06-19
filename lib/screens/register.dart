import 'package:flutter/material.dart';
import 'package:mytech1/screens/login.dart';
import 'package:mytech1/screens/product_overview_screens.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final myColor =
        ColorScheme.fromSwatch(primarySwatch: Colors.purple).secondary;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: height * 0.4,
              decoration: BoxDecoration(
                  color: myColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(80.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    width: 70,
                    height: 70,
                    margin: const EdgeInsets.symmetric(vertical: 55.0),
                    decoration: BoxDecoration(
                        border: Border.all(width: 5.0, color: Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(70.0))),
                    child: Image(
                      image: const AssetImage('asset/order.png'),
                      color: Colors.grey[200],
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 45),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(LoginScreen.routeName);
                          },
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                                fontFamily: 'sans serif',
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(7.0)),
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
                      hintText: 'Fullname',
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(7.0)),
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
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(7.0)),
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
                      hintText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  width: width * 0.95,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(7.0)),
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
                        Icons.password,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 25.0),
              width: double.infinity,
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: ElevatedButton(
                  style: const ButtonStyle(),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(ProductsOverviewScreen.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Register',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
