import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giggle_chat_app/constants.dart';
import 'package:giggle_chat_app/helper/show_snack_bar.dart';
import 'package:giggle_chat_app/screens/chat_page.dart';
import 'package:giggle_chat_app/widgets/custom_button.dart';
import 'package:giggle_chat_app/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static String id = "RegisterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

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
                      "Register",
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
                        await registerUser();
                        Navigator.pushNamed(context, ChatPage.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              "The account already exists for that email.");
                        }
                      } catch (e) {
                        showSnackBar(
                            context, "There was an error, Try again later.");
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                  buttonTitle: 'Register',
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff6083C5),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
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

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
