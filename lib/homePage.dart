import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myproject/auth/MainPage.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(150.0),
          child: GestureDetector(
          onTap: () {
            Navigator.pop(context, (route) =>  MainPage(),);
          },
          child: SvgPicture.asset(
            'assets/images/Chevron.svg',
          ),
                ),
        ),
    );
  }
}
