import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/data/provider/auth_repository_provider.dart';
import 'package:refugee_care_mobile/domain/repositroy/auth_repository.dart';
import 'package:refugee_care_mobile/feature/auth/register/register_notifier.dart';
import 'package:refugee_care_mobile/feature/auth/register/register_screen_state.dart';

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterScreenState>((ref) {
  final AuthenticationRepository authRepository =
      ref.watch(authRepositoryProvider);
  return RegisterNotifier(authRepository: authRepository);
});

// class RegisterScreenState {
//   final bool loading;

//   String name = "";
//   String password = "";
//   bool obscurePasswod = true;
//   String confirmedPassword = "";
//   bool obscureConfirmPasswod = true;
//   String email = "";
//   String phoneNo = "";

//   // factory RegisterScreenState.fromJson(Map<String, Object?> json) =>
//   //     _$RegisterScreenState(json);
//   final formKey = GlobalKey<FormState>();
//   bool enabledNextButton;
//   RegisterScreenState({this.loading = false, this.enabledNextButton = true});
// }

// class RegisterProvider with ChangeNotifier {
// @riverpod
// class RegisterViewModel extends _$RegisterViewModel {
//   // var _state = RegisterScreenState();
//   // RegisterScreenState get state => _state;
//   @override
//   Future<RegisterScreenState> build() async {
//     // ref.watch(otherProvider); // Good!
//     // ref.onDispose(() => ref.watch(otherProvider)); // Bad!

//     return Future.value(
//         RegisterScreenState(enabledNextButton: true, loading: false));
//   }

//   void init() {}

//   void updateFullName(String value) {
//     state.value?.name = value;

//     //notifyListeners();
//   }

//   void updatePhoneNo(String value) {
//     state.value?.phoneNo = value;
//     // notifyListeners();
//   }

//   void updateEmail(String value) {
//     state.value?.email = value;
//     // notifyListeners();
//   }

//   void updatePassword(String value) {
//     state.value?.password = value;
//     // notifyListeners();
//   }

//   void updateObsurePassword(bool value) {
//     state.value?.obscurePasswod = value;
//     // notifyListeners();
//   }

//   void updateObsureConfirmPassword(bool value) {
//     state.value?.obscureConfirmPasswod = value;
//     // notifyListeners();
//   }

//   void updateConfiremdPassword(String value) {
//     state.value?.confirmedPassword = value;
//     // notifyListeners();
//   }

//   bool validate() {
//     return state.value?.formKey.currentState?.validate() ?? false;
//   }

//   void sumbit(Function() onSuccess) {
//     if (validate()) {
//       state.value?.formKey.currentState?.save();
//       onSuccess();
//     }
//   }

//   void clear() {
//     // state = RegisterScreenState();
//     // notifyListeners();
//   }
// }

// class RegisterProvider with ChangeNotifier {
//   var _state = RegisterScreenState();
//   RegisterScreenState get state => _state;
//   void init() {}

//   void updateFullName(String value) {
//     _state.name = value;
//     //notifyListeners();
//   }

//   void updatePhoneNo(String value) {
//     _state.phoneNo = value;
//     notifyListeners();
//   }

//   void updateEmail(String value) {
//     _state.email = value;
//     notifyListeners();
//   }

//   void updatePassword(String value) {
//     _state.password = value;
//     notifyListeners();
//   }

//   void updateObsurePassword(bool value) {
//     _state.obscurePasswod = value;
//     notifyListeners();
//   }

//   void updateObsureConfirmPassword(bool value) {
//     _state.obscureConfirmPasswod = value;
//     notifyListeners();
//   }

//   void updateConfiremdPassword(String value) {
//     _state.confirmedPassword = value;
//     notifyListeners();
//   }

//   bool validate() {
//     return _state.formKey.currentState?.validate() ?? false;
//   }

//   void sumbit(Function() onSuccess) {
//     if (validate()) {
//       _state.formKey.currentState?.save();
//       onSuccess();
//     }
//   }

//   void clear() {
//     _state = RegisterScreenState();
//     notifyListeners();
//   }
// }
