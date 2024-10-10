import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:refugee_care_mobile/feature/auth/presenter/login/provider/login_notifier.dart';

final loginProvider =
    NotifierProvider<LoginNotifier, LoginState>(LoginNotifier.new);

// class LoginScreenState {
//   final bool loading;

//   String name = "";
//   String password = "";
//   bool obscurePasswod = true;
//   String confirmedPassword = "";
//   bool obscureConfirmPasswod = true;
//   String email = "";
//   String phoneNo = "";

//   final formKey = GlobalKey<FormState>();
//   bool enabledNextButton;
//   LoginScreenState({this.loading = false, this.enabledNextButton = true});
// }

// class LoginProvider with ChangeNotifier {
//   var _state = LoginScreenState();
//   LoginScreenState get state => _state;
//   void init() {}

//   void updatePhoneNo(String value) {
//     _state.phoneNo = value;
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
//     _state = LoginScreenState();
//     notifyListeners();
//   }
// }
