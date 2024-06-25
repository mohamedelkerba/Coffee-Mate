import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myproject/constants.dart';
import 'package:myproject/core/colors.dart';
import 'package:myproject/core/widgets/customButton.dart';
import 'package:myproject/core/widgets/customTextField.dart';
import 'package:myproject/core/widgets/defaultText.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/images/Chevron.svg',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              DefaultText(
                text: 'Welcome back! Glad to see you, Again!',
                fontSize: 24,
                fontColor: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 32,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hint: 'Email or Username',
                      maxLines: 1,
                      height: 48,
                      isBorder: true,
                      radius: 10,
                      controller: email,
                      validator: (value) {
                        RegExp regExp = RegExp(emailPattern);
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                      autoFocus: true,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextFormField(
                      hint: 'Password',
                      maxLines: 1,
                      height: 48,
                      isBorder: true,
                      radius: 10,
                      controller: password,
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        return null;
                      },
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(
                          _passwordVisible
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        iconSize: kDefaultPadding,
                      ),
                      obsecureText: _passwordVisible,
                      autoFocus: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 240.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Forgot Password?',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      width: 400,
                      height: 50,
                      title: 'Login',
                      onPress: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            );
                            if(credential.user!.emailVerified){
                              Navigator.of(context).pushReplacementNamed('homepage');
                            }
                            else{
                                AwesomeDialog(
                                    context:context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'Error',
                                  desc: 'please , go to email and click the link to verify your account ! '
                                );
                            }
                          } on FirebaseAuthException catch (e) {
                            String errorMessage;
                            if (e.code == 'user-not-found') {
                              errorMessage =
                              'No user found for that email.';
                            }
                            else if (e.code == 'wrong-password') {
                              errorMessage =
                              'Wrong password provided.';
                            }
                            else {
                              errorMessage =
                              'An error occurred. Please try again.';
                            }
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: focusColor,
                                content: Text(errorMessage)));}
                          catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                backgroundColor: focusColor,
                                content: Text(
                                    'An error occurred. Please try again.')));
                          }
                        }
                      },
                      borderColor: const Color(0xff182A3C),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultText(
                            text: "Or sign in with",
                            fontSize: 14,
                            fontColor: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: 120,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: borderColor)),
                              child: Center(
                                  child: SvgPicture.asset(
                                      'assets/images/Vector.svg'))),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: 120,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: borderColor)),
                              child: Center(
                                  child: SvgPicture.asset(
                                      'assets/images/google_ic.svg'))),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 60.0, vertical: 24),
                      child: GestureDetector(
                        onTap: () {},
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Register Now',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff203549),
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushReplacementNamed('register');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
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
