import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login-screen';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found");
      }
    }
    return user;
  }

  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }

  void _toHomeScreen(BuildContext ctx) {
    Navigator.of(context).pushNamed(
      HomeScreen.routeName,
    );
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    // _emailController = TextEditingController();
    // _passwordController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // _emailController.dispose();
    // _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/img/top_L.jpg",
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/img/top_R.png",
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 0,
                    child: Image.asset(
                      "assets/img/down_L.png",
                    ),
                  ),
                  Positioned(
                    top: 150,
                    right: 0,
                    child: Image.asset(
                      "assets/img/down_R.png",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 110, top: 125, bottom: 120),
                    child: const Text(
                      "Welcome Back!",
                      style: TextStyle(
                        color: Color.fromARGB(255, 49, 49, 49),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                                _showButtonPressDialog(context, 'Google');
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
                        'OR LOGIN WITH EMAIL',
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
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email address",
                          prefixIcon: Icon(Icons.email, color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
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
                          User? user = await loginUsingEmailPassword(
                              email: _emailController.text,
                              password: _passwordController.text,
                              context: context);
                          print(user);
                          if (user != null) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        },
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: () => _toHomeScreen(context),
                      child: Container(
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
