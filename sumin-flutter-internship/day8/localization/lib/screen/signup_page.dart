import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:localization/config/colour.dart';
import 'package:localization/config/font_style.dart';
import 'package:localization/widgets/display_snackbar.dart';
import 'package:localization/widgets/submit_button.dart';
import 'package:localization/widgets/wave_clipper.dart';
import 'package:localization/widgets/text_box.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: screenHeight * .4,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: grediantcolour),
                    ),
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.register,
                        style: Heading1.style,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * .1,
                ),
                TextBox(
                  hintText: AppLocalizations.of(context)!.email,
                  textEditingController: _emailController,
                  validator: (value) => value!.isEmpty
                      ? AppLocalizations.of(context)!.emailvalid
                      : null,
                  showEyeIcon: false,
                  textInputAction: TextInputAction.next,
                ),
                const Gap(20),
                TextBox(
                  hintText: AppLocalizations.of(context)!.password,
                  textEditingController: _passwordController,
                  validator: (value) => value!.length < 8
                      ? AppLocalizations.of(context)!.passwordvalid
                      : null,
                  showEyeIcon: true,
                  textInputAction: TextInputAction.next,
                ),
                const Gap(20),
                TextBox(
                  hintText: AppLocalizations.of(context)!.password,
                  textEditingController: _confirmPassword,
                  // ignore: unrelated_type_equality_checks
                  validator: (value) => value != _passwordController
                      ? AppLocalizations.of(context)!.confirmvalid
                      : null,
                  showEyeIcon: true,
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () {
                    _submitform();
                  },
                ),
                SizedBox(
                  height: screenHeight * .1,
                ),
                SubmitButton(
                  buttonText: AppLocalizations.of(context)!.register,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.go('/signup');
                    } else {
                      SnackbarManager snackbarManager =
                          SnackbarManager(context);
                      snackbarManager
                          .displaySnackBar(AppLocalizations.of(context)!.error);
                    }
                  },
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.haveAccount,
                      style: Options.style,
                    ),
                    TextButton(
                      onPressed: () {
                        context.go('/');
                      },
                      child: Text(
                        AppLocalizations.of(context)!.register,
                        style: Options.style,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitform() {
    if (_formKey.currentState!.validate()) {
      // Navigate to SignUp page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUp()),
      );
    } else {
      SnackbarManager snackBarManager = SnackbarManager(context);
      snackBarManager.displaySnackBar(AppLocalizations.of(context)!.error);
    }
  }
}
