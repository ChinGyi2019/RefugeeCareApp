import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/domain/model/auth/auth_state.dart';
import 'package:refugee_care_mobile/feature/auth/presenter/register/provider/register_provider.dart';
import 'package:refugee_care_mobile/feature/entry_point/entry_point.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_dialog.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_form_feild.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_loading.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  static const String routeName = '/register';
  final String title;
  const RegisterScreen({super.key, required this.title});
  @override
  ConsumerState<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends ConsumerState<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(registerNotifierProvider);
    final provider = ref.read(registerNotifierProvider.notifier);
    final formKey = GlobalKey<FormState>();

    double appBarHeight = Theme.of(context).appBarTheme.toolbarHeight ?? 70;

    ref.listen(
      registerNotifierProvider.select((value) => value.authState),
      ((previous, next) {
        if (next is Failure) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return RefugeeDialog(
                title: 'Register Failed',
                message: next.exception.message.toString(),
                singleBtnTitle: 'Try again',
                singleBtnCallback: () {
                  context.pop();
                },
              );
            },
          );
        } else if (next is Success) {
          context.go(EntryPoint.routeName);
        }
      }),
    );

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
        body: Center(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                    child: Form(
                        key: formKey,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                gapH16,
                                RefugeeFormFeild(
                                  title: 'Full name',
                                  decoration: const InputDecoration(
                                      hintText: 'Enter your full name'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                  value: uiState.name,
                                  onChanged: (values) {
                                    provider.updateFullName(values);
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
                                  value: uiState.phoneNo,
                                  onSaved: (value) {
                                    provider.updatePhoneNo(value!);
                                  },
                                  keyboardType: TextInputType.phone,
                                ),
                                RefugeeFormFeild(
                                  title: "Email",
                                  decoration: const InputDecoration(
                                      hintText: 'Enter your email'),
                                  value: uiState.email,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your valid email';
                                    }
                                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        .hasMatch(value)) {
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
                                  obscureText: uiState.obscurePassword,
                                  value: uiState.password,
                                  decoration: InputDecoration(
                                      hintText: 'Enter your password',
                                      suffixIcon: IconButton(
                                        icon: uiState.obscurePassword
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off),
                                        onPressed: () {
                                          provider.updateObsurePassword(
                                              !uiState.obscurePassword);
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
                                  obscureText: uiState.obscureConfirmPassword,
                                  value: uiState.confirmedPassword,
                                  decoration: InputDecoration(
                                      hintText: 'Enter your confirmed password',
                                      suffixIcon: IconButton(
                                        icon: uiState.obscureConfirmPassword
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off),
                                        onPressed: () {
                                          provider.updateObsureConfirmPassword(
                                              !uiState.obscureConfirmPassword);
                                        },
                                      )),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password again';
                                    }
                                    if (uiState.password !=
                                        uiState.confirmedPassword) {
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
                                      onPressed: uiState.enabledNextButton
                                          ? () {
                                              if (formKey.currentState
                                                      ?.validate() ==
                                                  true) {
                                                provider.register();
                                              }
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
                            if (uiState.loading)
                              const Align(
                                alignment: Alignment.center,
                                child: RefugeeLoading(),
                              ),
                          ],
                        ))))));
  }
}
