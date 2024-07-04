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
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 400),
                CustomButton(
                  height: 48,
                  width: 342,
                  title: 'Login',
                  onPress: () {
                    Navigator.of(context).pushNamed('login');
                  },
                  borderColor: const Color(0xffd26001).withOpacity(0.8),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  height: 48,
                  width: 342,
                  bgColor: const Color(0xffd26001).withOpacity(0.1),
                  title: 'Register',
                  onPress: () {
                    Navigator.of(context).pushNamed('register');
                  },
                  color: const Color(0xffd26001),
                  borderColor: const Color(0xffd26001).withOpacity(0.8), // Optional black border
                ),
                const SizedBox(height: 55),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: ()async {
                      userCredential = await FirebaseAuth.instance.signInAnonymously();
                      Navigator.of(context).pushNamedAndRemoveUntil('homepage', (route) => false);
                    },
                    child: DefaultText(
                      text:   'Continue as guest',
                      fontSize: 16,
                      fontColor: const  Color(0xffd26001),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

      ],
    );
  }
}
