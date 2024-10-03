import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:refugee_care_mobile/feature/auth/presenter/login/login_provider.dart';
import 'package:refugee_care_mobile/feature/auth/presenter/otp/otp_screen.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_form_feild.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  final String title;
  const LoginScreen({super.key, required this.title});
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    double appBarHeight = Theme.of(context).appBarTheme.toolbarHeight ?? 70;
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
          shadowColor: null,
          centerTitle: false,
          backgroundColor: AppColors.primaryLight,
          leading: context.canPop()
              ? IconButton(
                  icon: const Icon(Icons.chevron_left_sharp),
                  color: AppColors.primary,
                  iconSize: 32, // Customize your icon here
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : null,
          title: Text(
            'Welcome back!',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontSize: 18),
          ),
        ),
        backgroundColor: AppColors.bgLight,
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: double.infinity,
            child: Form(
              key: provider.state.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapH16,
                  RefugeeFormFeild(
                    title: "Phone number",
                    decoration: const InputDecoration(
                        hintText: 'Enter your phone number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                      //     .hasMatch(value)) {
                      //   return 'Please enter a valid email';
                      // }
                      return null;
                    },
                    onChanged: (value) {
                      provider.updatePhoneNo(value);
                    },
                    value: provider.state.phoneNo,
                    onSaved: (value) {
                      provider.updatePhoneNo(value!);
                    },
                    keyboardType: TextInputType.phone,
                  ),
                  gapH16,
                  RefugeeFormFeild(
                    title: "Password",
                    obscureText: provider.state.obscurePasswod,
                    value: provider.state.password,
                    decoration: InputDecoration(
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            provider.updateObsurePassword(
                                !provider.state.obscurePasswod);
                          },
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                      //     .hasMatch(value)) {
                      //   return 'Please enter a valid email';
                      // }
                      return null;
                    },
                    onChanged: (value) {
                      provider.updatePassword(value);
                    },
                    onSaved: (value) {
                      provider.updatePassword(value!);
                    },
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  gapH16,
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: provider.state.enabledNextButton
                            ? () {
                                provider.sumbit(() {
                                  context.push(OtpScreen.routeName);
                                });
                              }
                            : null,
                        child: Text('Login',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
