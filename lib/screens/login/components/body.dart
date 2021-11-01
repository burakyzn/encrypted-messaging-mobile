import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secured_chat_app/components/already_have_an_account_check.dart';
import 'package:secured_chat_app/components/rounded_button.dart';
import 'package:secured_chat_app/components/rounded_input_field.dart';
import 'package:secured_chat_app/components/rounded_password_field.dart';
import 'package:secured_chat_app/screens/login/components/background.dart';
import 'package:secured_chat_app/screens/login/loginController.dart';
import 'package:secured_chat_app/screens/register/register_screen.dart';
import 'package:get/get.dart';

import '../loginController.dart';
import '../loginController.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Giriş Yap",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              textEditingController: loginController.emailController,
              hintText: "E-Mail",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              textEditingController: loginController.passwordController,
              onChanged: (value) {},
            ),
            Obx(
              () => RoundedButton(
                text: loginController.loginLoading.value
                    ? "Giriş Yapılıyor"
                    : "Giriş Yap",
                press: () {
                  loginController.login();
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RegisterScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
