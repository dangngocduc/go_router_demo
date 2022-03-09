import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> implements Listenable {
  List<VoidCallback> listenable = [];
  LoginCubit() : super(LoginStateUnAuthorized()) {
    stream.listen((event) {
      for (var element in listenable) {
        element.call();
      }
    });
  }

  @override
  void addListener(VoidCallback listener) {
    listenable.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    listenable.remove(listener);
  }

  void login(String username, String password) {
    emit(LoginStateAuthorized());
  }

  void logout() {
    emit(LoginStateUnAuthorized());
  }
}
