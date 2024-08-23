import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:refugee_care_mobile/feature/auth/otp/otp_screen.dart';
import 'package:refugee_care_mobile/feature/auth/register/register_provider.dart';
import 'package:refugee_care_mobile/feature/entry_point/entry_point.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_form_feild.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  final String title;
  const RegisterScreen({super.key, required this.title});
  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  // @override
  // void initState() {
  //   super.initState();

  //   // Set full-screen mode when entering this screen
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // }

  // @override
  // void dispose() {
  //   // Reset to the normal system UI mode when leaving this screen
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context);
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
            'Register with us',
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
                    title: 'Full name',
                    decoration:
                        const InputDecoration(hintText: 'Enter your full name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    value: provider.state.name,
                    onChanged: (value) {
                      provider.updateFullName(value);
                      // provider.name = value;
                    },
                    onSaved: (value) {
                      provider.updateFullName(value!);
                      // provider.name = value!;
                    },
                  ),
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
                  RefugeeFormFeild(
                    title: "Email",
                    decoration:
                        const InputDecoration(hintText: 'Enter your email'),
                    value: provider.state.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your valid email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      provider.updateEmail(value);
                    },
                    onSaved: (value) {
                      provider.updateEmail(value!);
                    },
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
                  RefugeeFormFeild(
                    title: "Confirm password",
                    obscureText: provider.state.obscureConfirmPasswod,
                    value: provider.state.confirmedPassword,
                    decoration: InputDecoration(
                        hintText: 'Enter your confirmed password',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            provider.updateObsureConfirmPassword(
                                !provider.state.obscureConfirmPasswod);
                          },
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password again';
                      }
                      if (provider.state.password !=
                          provider.state.confirmedPassword) {
                        return 'Please re-enter password again';
                      }
                      // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                      //     .hasMatch(value)) {
                      //   return 'Please enter a valid email';
                      // }
                      return null;
                    },
                    onChanged: (value) {
                      provider.updateConfiremdPassword(value);
                    },
                    onSaved: (value) {
                      provider.updateConfiremdPassword(value!);
                    },
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  gapH20,
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
                        child: Text('Register',
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
