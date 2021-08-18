//import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flix/screens/homescreen.dart';
//import 'package:flix/widgets/homewidget.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User firebaseUser;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('FLIX'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: isSignIn
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      icon: Image.asset(
                        "assets/images/popcorn.png",
                        height: 100,
                        width: 100,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      label: Text(
                        "Lets' Go",
                        style: TextStyle(fontSize: 30),
                      )),
                  SizedBox(
                    height: 70,
                  ),
                  ElevatedButton(
                      child: Text('SignOut'),
                      onPressed: () {
                        signOut();
                      }),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   constraints: BoxConstraints.expand(),
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image: AssetImage("assets/images/popcorn.png"),
                  //           //image: NetworkImage("https://flutter-examples.com/wp-content/uploads/2020/02/dice.jpg"),
                  //           fit: BoxFit.cover)),
                  // ),
                  Text(
                    'Sign In to Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  FloatingActionButton.extended(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      icon: Image.asset(
                        "assets/images/google.png",
                        height: 50,
                        width: 50,
                      ),
                      onPressed: () {
                        googlesign();
                      },
                      label: Text("Sign In with Google"))
                ],
              ),
            ),
    );
  }

  bool isSignIn = false;
  googlesign() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();

    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    GoogleSignInAuthentication authentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    UserCredential result = await firebaseAuth.signInWithCredential(credential);
    firebaseUser = result.user!;

    setState(() {
      isSignIn = true;
    });
  }

  signOut() async {
    _googleSignIn.signOut().then((value) {
      setState(() {
        isSignIn = false;
      });
    });
  }
}
