// ignore_for_file: constant_identifier_names
part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const WELCOME = _Paths.WELCOME;
  static const BIRTHDAY = _Paths.BIRTHDAY;
  static const MAIN = _Paths.MAIN;
  static const NAVIGATOR = _Paths.NAVIGATOR;
  static const HOME = _Paths.HOME;
  static const SERVICE = _Paths.SERVICE;
  static const SERVICE_COMPONENT = _Paths.SERVICE_COMPONENT;
  static const FANDB = _Paths.FANDB;
  static const CART = _Paths.CART;
  static const EVENT = _Paths.EVENT;
  static const ABTRACTION = _Paths.ABTRACTION;
  static const ORDER = _Paths.ORDER;
  static const FEEDBACK = _Paths.FEEDBACK;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const WELCOME = '/welcome';
  static const BIRTHDAY = '/birthday';
  static const MAIN = '/mainscreen';
  static const NAVIGATOR = '/navigator';
  static const HOME = '/homepage';
  static const SERVICE = '/service';
  static const SERVICE_COMPONENT = '/service-component';
  static const FANDB = '/fandb';
  static const CART = '/cart'; //add customer id to check
  static const EVENT = '/event';
  static const ABTRACTION = '/abtraction';
  static const ORDER = '/order';
  static const FEEDBACK = '/feedback';
}
