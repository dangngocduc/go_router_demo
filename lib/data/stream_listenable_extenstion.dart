import 'package:flutter/material.dart';

extension StreamListenableExtension on Stream {
  Listenable getListenable() {
    ChangeNotifier changeNotifier = ChangeNotifier();
    listen((event) {
      // ignore_for_file: invalid_use_of_visible_for_testing_member
      // ignore_for_file: invalid_use_of_protected_member
      changeNotifier.notifyListeners();
    });
    return changeNotifier;
  }
}
