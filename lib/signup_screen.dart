// import 'package:hackthon_app/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:hackthon_app/screens/signup_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late bool _success;
  late String _userEmail;

  void _showButtonPressDialog(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('User Account Added!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void _register() async {
      final User user = (await _auth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user!;

      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email!;
        });
      } else {
        setState(() {
          _success = false;
        });
      }
    }

    return Material(
      child: Container(
        color: Colors.white,
        height: 1000,
        width: double.infinity,
        child: Stack(children: [
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/top_L.jpg",
              )),
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/top_R.png",
              )),
          Positioned(
              top: 150,
              left: 0,
              child: Image.asset(
                "assets/down_L.png",
              )),
          Positioned(
              top: 150,
              right: 0,
              child: Image.asset(
                "assets/down_R.png",
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 90.0),
                const Text(
                  "Create your account!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 49, 49, 49),
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 80.0),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: SignInButton(
                          Buttons.Google,
                          text: 'CONTINUE WITH GOOGLE',
                          padding: const EdgeInsets.all(4.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0)),
                          onPressed: () {
                            // _showButtonPressDialog(context, 'Google');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Center(
                  child: Text(
                    'OR SIGN UP WITH EMAIL',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black45,
                    ),
                  ),
                ),
                const SizedBox(height: 22.0),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _usernameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Username",
                        prefixIcon: Icon(Icons.person, color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28))),
                  ),
                ),
                const SizedBox(height: 22.0),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email address",
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28))),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28)),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const SizedBox(
                  height: 16.0,
                ),
                Container(
                  width: 300,
                  child: RawMaterialButton(
                    fillColor: Colors.redAccent,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    onPressed: () async {
                      _register();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  child: Text(
                    "Go back?",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
