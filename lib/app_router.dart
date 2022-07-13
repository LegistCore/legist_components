import 'package:flutter/material.dart';
import 'components/side_menu_buttons.dart';
import 'components/side_menu_date.dart';
import 'components/side_menu_email.dart';
import 'components/side_menu_phone.dart';
import 'show_case/second_sprint.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SecondSprint.routeName:
        return _pageBuilder((context) => const SecondSprint());
      case SideMenuEmail.routeName:
        return _pageBuilder((context) => const SideMenuEmail());
      case SideMenuPhone.routeName:
        return _pageBuilder((context) => const SideMenuPhone());
      case SideMenuDate.routeName:
        return _pageBuilder((context) => const SideMenuDate());
      case SideMenuButtons.routeName:
        return _pageBuilder((context) => const SideMenuButtons());
    }
  }

  static MaterialPageRoute _pageBuilder(WidgetBuilder builder) {
    return MaterialPageRoute(builder: builder);
  }
}
