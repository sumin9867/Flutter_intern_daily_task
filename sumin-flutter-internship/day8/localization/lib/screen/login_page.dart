import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:localization/config/colour.dart';
import 'package:localization/state/cubit.dart';
import 'package:localization/config/font_style.dart';
import 'package:localization/state/theme_cubit.dart';
import 'package:localization/widgets/display_snackbar.dart';
import 'package:localization/widgets/submit_button.dart';
import 'package:localization/widgets/wave_clipper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/widgets/text_box.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          actions: [
            BlocBuilder<LocaleCubit, Locale?>(
              builder: (context, state) {
                return SizedBox(
                  width: screenWidth * .11,
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    icon: const Icon(null),
                    value: state,
                    items: AppLocalizations.supportedLocales.map((locale) {
                      return DropdownMenuItem(
                        alignment: Alignment.centerRight,
                        value: locale,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (locale.languageCode == 'en')
                              Image.asset("images/flag.png",
                                  width: 20, height: 20),

                            if (locale.languageCode == 'ne')
                              Image.asset("images/nepal.png",
                                  width: 20, height: 20),
                            // Add more conditions for other supported locales
                          ],
                        ),
                      );
                    }).toList(),
                    // didnr get
                    onChanged: (locale) {
                      if (locale != null) {
                        context.read<LocaleCubit>().changeLocale(locale);
                      }
                    },
                  ),
                );
              },
            ),
            BlocBuilder<ThemeCubit, MyTheme?>(
              builder: (context, themeState) {
                return DropdownButton<MyTheme>(
                  value: themeState,
                  items: MyTheme.values.map((theme) {
                    return DropdownMenuItem<MyTheme>(
                      value: theme,
                      child: Text(theme == MyTheme.light ? 'Light' : 'Dark'),
                    );
                  }).toList(),
                  onChanged: (selectedTheme) {
                    if (selectedTheme != null) {
                      context.read<ThemeCubit>().changeTheme(selectedTheme);
                    }
                  },
                );
              },
            ),
          ],
        ),
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
                        AppLocalizations.of(context)!.login,
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
                  textInputAction: TextInputAction.go,
                  onEditingComplete: () {
                    _submitform();
                  },
                ),
                SizedBox(
                  height: screenHeight * .1,
                ),
                SubmitButton(
                  buttonText: AppLocalizations.of(context)!.login,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.go('/signup');
                    } else {
                      SnackbarManager snackBarManager =
                          SnackbarManager(context);
                      snackBarManager
                          .displaySnackBar(AppLocalizations.of(context)!.error);
                    }
                  },
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.noaccount,
                      style: Options.style,
                    ),
                    TextButton(
                      onPressed: () => context.go('/signup'),
                      child: Text(
                        AppLocalizations.of(context)!.signup,
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
      context.go('/signup');
    } else {
      SnackbarManager snackBarManager = SnackbarManager(context);
      snackBarManager.displaySnackBar(AppLocalizations.of(context)!.error);
    }
  }
}
