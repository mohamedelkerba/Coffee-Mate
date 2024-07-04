import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myproject/auth/MainPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      actions: [
          IconButton(
            onPressed: ()async{
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              // sign out
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil('login',(route)=>false);
            },
            icon: const Icon(Icons.logout_outlined),
          )

        ],
        ),
      body: Container(

      ),
    );


  }
}

