import 'package:evently/auth/provider/auth_provider.dart';
import 'package:evently/auth/screens/login_screen.dart';
import 'package:evently/auth/widgets/auth_text_field.dart';
import 'package:evently/common/app_assets.dart';
import 'package:evently/common/app_colors.dart';
import 'package:evently/common/widgets/custom_main_button.dart';
import 'package:evently/common/widgets/custom_text_styles.dart';
import 'package:evently/common/widgets/localization_switch.dart';
import 'package:evently/home/main_layer_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signInScreen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
            AuthTextField(
              controller: nameController,
              prefixIconPath: AppAssets.emailIcon,
              hintText: 'name', //TODO:localization
            ),
            AuthTextField(
              controller: emailController,
              prefixIconPath: AppAssets.emailIcon,
              hintText: 'Email', //TODO:localization
            ),
            AuthTextField(
              controller: passwordController,
              password: true,
              prefixIconPath: AppAssets.passwordIcon,
              hintText: 'Password', //TODO:localization
            ),
            const AuthTextField(
              password: true,
              prefixIconPath: AppAssets.passwordIcon,
              hintText: 'Re Password', //TODO:localization
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomMainButton(
                    title: 'Create Account',
                    onPressed: () {
                      setState(() {
                        loading = true;
                      });
                      context
                          .read<UserAuthProvider>()
                          .userSignup(
                              email: emailController.text.trim(),
                              password: passwordController.text,
                              name: nameController.text.trim())
                          .then(
                        (value) {
                          if (value == null) {
                            Navigator.of(context)
                                .pushNamed(MainLayerScreen.routeName);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'user logedIn successfly:${context.read<UserAuthProvider>().userModel?.name}',
                                style: CustomTextStyles.style18w500White,
                              ),
                              backgroundColor: Colors.green,
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                value,
                                style: CustomTextStyles.style18w500White,
                              ),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                      );
                    },
                  ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Already Have Account ?",
                      style: Theme.of(context).textTheme.labelMedium),
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
