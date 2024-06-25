import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myproject/constants.dart';
import 'package:myproject/core/colors.dart';
import 'package:myproject/core/widgets/customButton.dart';
import 'package:myproject/core/widgets/customTextField.dart';
import 'package:myproject/core/widgets/defaultText.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordVisible = true;
  bool _confirmPasswordVisible = true;

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
          child: Form(
            key: _formKey,
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
                  text: 'Hello! Register to get   started',
                  fontSize: 24,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomTextFormField(
                  controller: userName,
                  label: 'Username',
                  hint: 'Username',
                  maxLines: 1,
                  height: 48,
                  isBorder: true,
                  radius: 10,
                  autoFocus: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormField(
                  controller: email,
                  label: 'Email',
                  hint: 'Email',
                  maxLines: 1,
                  height: 48,
                  isBorder: true,
                  radius: 10,
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
                  controller: password,
                  label: 'Password',
                  hint: 'Password',
                  maxLines: 1,
                  height: 48,
                  isBorder: true,
                  radius: 10,
                  autoFocus: true,
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
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormField(
                  controller: confirmPassword,
                  label: 'Confirm Password',
                  hint: 'Confirm Password',
                  maxLines: 1,
                  height: 48,
                  isBorder: true,
                  radius: 10,
                  autoFocus: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != password.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _confirmPasswordVisible = !_confirmPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _confirmPasswordVisible
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    iconSize: kDefaultPadding,
                  ),
                  obsecureText: _confirmPasswordVisible,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormField(
                  controller: phoneNumber,
                  label: 'Phone number',
                  hint: 'Phone number',
                  maxLines: 1,
                  height: 48,
                  isBorder: true,
                  radius: 10,
                  autoFocus: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  width: 400,
                  height: 50,
                  title: 'Register',
                  onPress: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final credential  = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );
                        Navigator.of(context).pushReplacementNamed('homepage');
                      } on FirebaseAuthException catch (e) {
                        String errorMessage;
                        if (e.code == 'weak-password') {
                          errorMessage = 'The password provided is too weak.';
                        }
                        else if (e.code == 'email-already-in-use') {
                          errorMessage = 'The account already exists for that email.';
                        }
                        else {
                          errorMessage = 'An error occurred. Please try again.';
                        }
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: focusColor,
                              content: Text(errorMessage)),);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                             backgroundColor: focusColor,
                             content: Text('An error occurred. Please try again.')),);
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
                        text: "Or sign up with",
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
                          border: Border.all(color: borderColor),
                        ),
                        child: Center(child: SvgPicture.asset('assets/images/Vector.svg')),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 120,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: borderColor),
                        ),
                        child: Center(child: SvgPicture.asset('assets/images/google_ic.svg')),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('login');
                    },
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
                            text: 'Login Now',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff203549),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushReplacementNamed('login');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
