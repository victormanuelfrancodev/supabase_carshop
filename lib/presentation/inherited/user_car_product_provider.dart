import 'package:flutter/material.dart';
import 'package:supabasemeetup/presentation/notifiers/user_car_products_notifier.dart';

class UserCarProductProvider extends InheritedWidget {
  final UserCarProductsNotifier userCarProductsNotifier;

  const UserCarProductProvider({
    super.key,
    required this.userCarProductsNotifier,
    required super.child,
  });

  static UserCarProductProvider? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<UserCarProductProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
