import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lingo/sign_up.dart';
import 'package:lingo/type_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final forekey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: forekey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(),
                    customSizedBox(),
                    emailTextField(),
                    customSizedBox(),
                    passwordTextField(),
                    customSizedBox(),
                    signInButton(),
                    customSizedBox(),
                    forgotPasswordButton(),
                    signUpButton(),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  Center signUpButton() {
    return Center(
        child: TextButton(
            onPressed: () => Navigator.pushNamed(context, '/signUp'),
            child: Text(
              "Hesabın yok mu? Kayıt Ol",
              style: TextStyle(color: Colors.yellow),
            )));
  }

  Center forgotPasswordButton() {
    return Center(
        child: TextButton(
            onPressed: () {},
            child: Text(
              "Şifremi Unuttum",
              style: TextStyle(color: Colors.yellow),
            )));
  }

  Center signInButton() {
    return Center(
        child: TextButton(
            onPressed: () async {
              if (forekey.currentState != null &&
                  forekey.currentState!.validate()) {
                forekey.currentState!.save();
                try {
                  final user = await firebaseAuth.signInWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => TypePage()));
                  print(user.user!.email);
                } catch (e) {
                  print(e.toString());
                }
              }
            },
            child: Container(
              height: 50,
              width: 150,
              margin: EdgeInsets.symmetric(horizontal: 60),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )));
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Şifre boş olamaz";
        }
        return null;
      },
      onSaved: (value) => password = value!,
      obscureText: true,
      style: TextStyle(color: Colors.white),
      decoration: customInputDecoration("Şifre"),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "E-posta boş olamaz";
        }
        return null;
      },
      onSaved: (value) => email = value!,
      style: TextStyle(color: Colors.white),
      decoration: customInputDecoration("E-posta"),
    );
  }

  Text titleText() {
    return Text(
      "Merhaba, \nHoşgeldin",
      style: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget customSizedBox() => SizedBox(height: 20);

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }
}
