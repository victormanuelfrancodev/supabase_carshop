// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter Demo`
  String get flutterDemo {
    return Intl.message(
      'Flutter Demo',
      name: 'flutterDemo',
      desc: '',
      args: [],
    );
  }

  /// `Counter increments smoke test`
  String get counterIncrementsSmokeTest {
    return Intl.message(
      'Counter increments smoke test',
      name: 'counterIncrementsSmokeTest',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message('name', name: 'name', desc: '', args: []);
  }

  /// `quantity`
  String get quantity {
    return Intl.message('quantity', name: 'quantity', desc: '', args: []);
  }

  /// `price`
  String get price {
    return Intl.message('price', name: 'price', desc: '', args: []);
  }

  /// `products`
  String get products {
    return Intl.message('products', name: 'products', desc: '', args: []);
  }

  /// `process_purchase`
  String get process_purchase {
    return Intl.message(
      'process_purchase',
      name: 'process_purchase',
      desc: '',
      args: [],
    );
  }

  /// `user_id`
  String get user_id {
    return Intl.message('user_id', name: 'user_id', desc: '', args: []);
  }

  /// `product_ids`
  String get product_ids {
    return Intl.message('product_ids', name: 'product_ids', desc: '', args: []);
  }

  /// `Car Shop`
  String get carShop {
    return Intl.message('Car Shop', name: 'carShop', desc: '', args: []);
  }

  /// `Failed`
  String get failed {
    return Intl.message('Failed', name: 'failed', desc: '', args: []);
  }

  /// `Payment Page`
  String get paymentPage {
    return Intl.message(
      'Payment Page',
      name: 'paymentPage',
      desc: '',
      args: [],
    );
  }

  /// `My Products`
  String get myProducts {
    return Intl.message('My Products', name: 'myProducts', desc: '', args: []);
  }

  /// `Home Page`
  String get homePage {
    return Intl.message('Home Page', name: 'homePage', desc: '', args: []);
  }

  /// `Welcome to the home page!`
  String get welcomeToTheHomePage {
    return Intl.message(
      'Welcome to the home page!',
      name: 'welcomeToTheHomePage',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message('Menu', name: 'menu', desc: '', args: []);
  }

  /// `Efficient Example`
  String get efficientExample {
    return Intl.message(
      'Efficient Example',
      name: 'efficientExample',
      desc: '',
      args: [],
    );
  }

  /// `insert_users`
  String get insert_users {
    return Intl.message(
      'insert_users',
      name: 'insert_users',
      desc: '',
      args: [],
    );
  }

  /// `count`
  String get count {
    return Intl.message('count', name: 'count', desc: '', args: []);
  }

  /// `users`
  String get users {
    return Intl.message('users', name: 'users', desc: '', args: []);
  }

  /// `points`
  String get points {
    return Intl.message('points', name: 'points', desc: '', args: []);
  }

  /// `insert!`
  String get insert {
    return Intl.message('insert!', name: 'insert', desc: '', args: []);
  }

  /// `Start Page`
  String get startPage {
    return Intl.message('Start Page', name: 'startPage', desc: '', args: []);
  }

  /// `Insert 100 users - client side`
  String get insert100UsersClientSide {
    return Intl.message(
      'Insert 100 users - client side',
      name: 'insert100UsersClientSide',
      desc: '',
      args: [],
    );
  }

  /// `Insert 100 users Fuction sql`
  String get insert100UsersFuctionSql {
    return Intl.message(
      'Insert 100 users Fuction sql',
      name: 'insert100UsersFuctionSql',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
