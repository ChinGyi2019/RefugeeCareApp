import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/auth/presenter/login/provider/login_provider.dart';
import 'package:refugee_care_mobile/feature/entry_point/entry_point.dart';
import 'package:refugee_care_mobile/shared/constants/ghaps.dart';
import 'package:refugee_care_mobile/shared/extensions/phone_number_validator.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_dialog.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_form_feild.dart';
import 'package:refugee_care_mobile/shared/widgets/refugee_loading.dart';
import 'package:refugee_care_mobile/theme/app_color.dart';

class LoginScreen extends HookConsumerWidget {
  static const String routeName = '/login';
  final String title;
  const LoginScreen({super.key, required this.title});
  // @override
  //  HookState<LoginScreen> createState() => LoginScreenState();

  // @override
  // ConsumerState<ConsumerStatefulWidget> createState() {
  //   return LoginScreenState();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final obscurePassword = useState<bool>(true);

    // useEffect(() {

    //   return null;
    // }, [loginState.isLoggedIn]);
    // useEffect(() {

    //   return null;
    // }, [loginState.errorMessage, loginState.isLoggedIn]);
    ref.listen(
      loginProvider.select((value) => value),
      ((previous, next) {
        if (next.errorMessage != null && next.errorMessage != "") {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return RefugeeDialog(
                title: 'Register Failed',
                message: next.errorMessage.toString(),
                singleBtnTitle: 'Try again',
                singleBtnCallback: () {
                  context.pop();
                },
              );
            },
          );
        } else if (next.isLoggedIn) {
          context.go(EntryPoint.routeName);
        }
      }),
    );
    // if (loginState.isLoggedIn) {
    //   context.go(EntryPoint.routeName);
    // }
    // if (loginState.errorMessage != null) {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text('Error'),
    //         content: Text(loginState.errorMessage!),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               context.pop(); // Close the dialog
    //             },
    //             child: Text('OK'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

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
            child: Stack(children: [
              Form(
                key: formKey,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH16,
                    RefugeeFormFeild(
                      title: "Phone number",
                      decoration: InputDecoration(
                          hintText: 'Enter your phone number',
                          prefixIcon: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                '+60',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        fontSize: 16,
                                        color: AppColors.textGrey,
                                        fontWeight: FontWeight.w500),
                              ))),
                      validator: (value) {
                        return validatePhoneNumber(value ?? '');
                      },
                      controller: phoneController,
                      // onChanged: (value) {
                      //   provider.updatePhoneNo(value);
                      // },
                      // value: provider.state.phoneNo,
                      // onSaved: (value) {
                      //   provider.updatePhoneNo(value!);
                      // },
                      keyboardType: TextInputType.phone,
                    ),
                    gapH16,
                    RefugeeFormFeild(
                      title: "Password",
                      obscureText: obscurePassword.value,
                      decoration: InputDecoration(
                          hintText: 'Enter your password',
                          suffixIcon: IconButton(
                            icon: obscurePassword.value
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              obscurePassword.value = !obscurePassword.value;
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
                      controller: passwordController,
                      // onChanged: (value) {
                      //   provider.updatePassword(value);
                      // },
                      // onSaved: (value) {
                      //   provider.updatePassword(value!);
                      // },
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    gapH16,
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              ref.read(loginProvider.notifier).login(
                                  phoneController.text,
                                  passwordController.text);
                            }
                          },
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
              ),
              if (loginState.isLoading)
                const Align(
                  alignment: Alignment.center,
                  child: RefugeeLoading(),
                ),
            ])));
  }
}

// class LoginScreenState extends ConsumerState<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final loginState = ref.watch(loginProvider);
//     final phoneController = useTextEditingController();
//     final passwordController = useTextEditingController();
//     final formKey = useMemoized(() => GlobalKey<FormState>());
//     final obscurePasswod = useState<bool>(true);
//     double appBarHeight = Theme.of(context).appBarTheme.toolbarHeight ?? 70;
//     // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           toolbarHeight: Theme.of(context).appBarTheme.toolbarHeight,
//           shadowColor: null,
//           centerTitle: false,
//           backgroundColor: AppColors.primaryLight,
//           leading: context.canPop()
//               ? IconButton(
//                   icon: const Icon(Icons.chevron_left_sharp),
//                   color: AppColors.primary,
//                   iconSize: 32, // Customize your icon here
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 )
//               : null,
//           title: Text(
//             'Welcome back!',
//             style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                 fontWeight: FontWeight.w700,
//                 color: AppColors.primary,
//                 fontSize: 18),
//           ),
//         ),
//         backgroundColor: AppColors.bgLight,
//         body: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             width: double.infinity,
//             height: double.infinity,
//             child: Form(
//               key: formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   gapH16,
//                   RefugeeFormFeild(
//                     title: "Phone number",
//                     obscureText: obscurePasswod.value,
//                     decoration: const InputDecoration(
//                         hintText: 'Enter your phone number'),
//                     validator: (value) {
//                       return validatePhoneNumber(value ?? '');
//                     },
//                     controller: phoneController,
//                     // onChanged: (value) {
//                     //   provider.updatePhoneNo(value);
//                     // },
//                     // value: provider.state.phoneNo,
//                     // onSaved: (value) {
//                     //   provider.updatePhoneNo(value!);
//                     // },
//                     keyboardType: TextInputType.phone,
//                   ),
//                   gapH16,
//                   RefugeeFormFeild(
//                     title: "Password",
//                     decoration: InputDecoration(
//                         hintText: 'Enter your password',
//                         suffixIcon: IconButton(
//                           icon: const Icon(Icons.visibility),
//                           onPressed: () {
//                             obscurePasswod.value = true;
//                           },
//                         )),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       // if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
//                       //     .hasMatch(value)) {
//                       //   return 'Please enter a valid email';
//                       // }
//                       return null;
//                     },
//                     controller: passwordController,
//                     // onChanged: (value) {
//                     //   provider.updatePassword(value);
//                     // },
//                     // onSaved: (value) {
//                     //   provider.updatePassword(value!);
//                     // },
//                     keyboardType: TextInputType.visiblePassword,
//                   ),
//                   gapH16,
//                   Padding(
//                     padding: const EdgeInsets.all(0.0),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: formKey.currentState?.validate() == true
//                             ? () {
//                                 ref.read(loginProvider.notifier).login(
//                                     phoneController.text,
//                                     passwordController.text);
//                               }
//                             : null,
//                         child: Text('Login',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineSmall!
//                                 .copyWith(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 16,
//                                     color: AppColors.white)),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )));
//   }
// }
