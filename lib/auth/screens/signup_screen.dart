import 'package:evently/auth/screens/login_screen.dart';
import 'package:evently/auth/widgets/auth_text_field.dart';
import 'package:evently/common/app_assets.dart';
import 'package:evently/common/app_colors.dart';
import 'package:evently/common/custom_main_button.dart';
import 'package:evently/common/custom_text_styles.dart';
import 'package:evently/common/localization_switch.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = '/signInScreen';
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Image.asset(
              AppAssets.logoImage,
              height: MediaQuery.of(context).size.height * .2,
            ),
            const SizedBox(
              height: 16,
            ),
            const AuthTextField(
              prefixIconPath: AppAssets.emailIcon,
              hintText: 'name', //TODO:localization
            ),
            const AuthTextField(
              prefixIconPath: AppAssets.emailIcon,
              hintText: 'Email', //TODO:localization
            ),
            const AuthTextField(
              password: true,
              prefixIconPath: AppAssets.passwordIcon,
              hintText: 'Password', //TODO:localization
            ),
            const AuthTextField(
              password: true,
              prefixIconPath: AppAssets.passwordIcon,
              hintText: 'Re Password', //TODO:localization
            ),
            CustomMainButton(
              title: 'Create Account',
              onPressed: () {},
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Already Have Account ?",
                      style: CustomTextStyles.style16w500Black),
                  TextSpan(
                    text: ' Login',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //TODO:go to login
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                    style: CustomTextStyles.style16w700Black.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.mainColor,
                        color: AppColors.mainColor,
                        fontStyle: FontStyle.italic),
                  )
                ])),
              ),
            ),
            LocalizationSwitch()
          ],
        ),
      ),
    );
  }
}
