import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myproject/core/widgets/customButton.dart';
import 'package:myproject/core/widgets/defaultText.dart';

class MainPage extends StatefulWidget {
   MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UserCredential? userCredential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
               DefaultText(
                text: 'Resume Builder',
                 fontSize: 24,
                  fontColor: Color(0xff203549),
                  fontWeight: FontWeight.bold,
                ),
              const SizedBox(height: 20),
              SvgPicture.asset(
                'assets/images/login.svg',
                fit: BoxFit.contain,
                height: 200,
              ),
              const SizedBox(height: 70),
              CustomButton(
                height: 48,
                width: 342,
                title: 'Login',
                onPress: () {
                  Navigator.of(context).pushNamed('login');
                },
                borderColor: const Color(0xff182A3C),
              ),
              const SizedBox(height: 20),
              CustomButton(
                height: 48,
                width: 342,
                bgColor: Colors.white,
                title: 'Register',
                onPress: () {
                  Navigator.of(context).pushNamed('register');
                },
                color: const Color(0xff203549),
                borderColor: Colors.black, // Optional black border
              ),
              const SizedBox(height: 55),
               MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: ()async {
                    // userCredential = await FirebaseAuth.instance.signInAnonymously();
                    // print(userCredential?.user?.uid);

                  },
                  child: DefaultText(
                   text:   'Continue as a guest',
                    fontSize: 16,
                      fontColor: Color(0xff203549),
                      fontWeight: FontWeight.bold,
                      textDecoration: TextDecoration.underline,
                    ),
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
