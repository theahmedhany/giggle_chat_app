import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giggle_chat_app/constants.dart';
import 'package:giggle_chat_app/helper/show_snack_bar.dart';
import 'package:giggle_chat_app/screens/chat_page.dart';
import 'package:giggle_chat_app/screens/register_page.dart';
import 'package:giggle_chat_app/widgets/custom_button.dart';
import 'package:giggle_chat_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String id = "LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: const Color(0xffC5DBF0),
      progressIndicator: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xff203590))),
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 80),
                Image.asset(
                  kLogo,
                  height: 100,
                ),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Giggle App",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lobster',
                        fontSize: 30,
                        color: Color(0xff230462),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                const Row(
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        fontFamily: 'Merienda-VariableFont',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff203590),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: "Email",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  obscureText: true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: "Password",
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await loginUser();
                        Navigator.pushNamed(context, ChatPage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context, 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              "Wrong password provided for that user.");
                        } else {
                          showSnackBar(context,
                              "Check your email and password.");
                        }
                      } catch (e) {
                        showSnackBar(
                            context, "There was an error, Try again later.");
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                  buttonTitle: 'Login',
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don\'t have an account? ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff6083C5),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: const Text(
                        " Register",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff230462),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
