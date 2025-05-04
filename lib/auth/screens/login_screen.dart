import 'package:evently/auth/screens/signup_screen.dart';
import 'package:evently/auth/widgets/auth_text_field.dart';
import 'package:evently/common/app_assets.dart';
import 'package:evently/common/app_colors.dart';
import 'package:evently/common/widgets/custom_main_button.dart';
import 'package:evently/common/widgets/custom_main_outlined_button.dart';
import 'package:evently/common/widgets/custom_text_styles.dart';
import 'package:evently/common/widgets/localization_switch.dart';
import 'package:evently/home/main_layer_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/loginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          maintainBottomViewPadding: true,
          child: ListView(
            padding: const EdgeInsets.all(16.0),

            // crossAxisAlignment: CrossAxisAlignment.center,
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
                hintText: 'Email', //TODO:localization
              ),
              const AuthTextField(
                password: true,
                prefixIconPath: AppAssets.passwordIcon,
                hintText: 'Password', //TODO:localization
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forget Password?',
                        style: CustomTextStyles.style16w700Black.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.mainColor,
                            color: AppColors.mainColor,
                            fontStyle: FontStyle.italic),
                      )),
                ],
              ),
              CustomMainButton(
                title: 'Login',
                onPressed: () => Navigator.of(context)
                    .pushNamed(MainLayerScreen.routeName), //TODO:edit
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Don't Have Account? ",
                        style: Theme.of(context).textTheme.labelMedium),
                    TextSpan(
                      text: 'Create Account',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //TODO:go to sign up
                          Navigator.of(context)
                              .pushReplacementNamed(SignupScreen.routeName);
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
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Or',
                      style: CustomTextStyles.style16w500Black
                          .copyWith(color: AppColors.mainColor),
                    ),
                  ),
                  const Expanded(child: const Divider()),
                ],
              ),
              CustomMainOutlinedButton(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(AppAssets.googleIcon),
                  ),
                  title: 'Login with Google',
                  onPressed: () {}),
              SizedBox(
                height: 30,
              ),
              LocalizationSwitch()
            ],
          )),
    );
  }
}
