// ignore_for_file: constant_identifier_names
part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const WELCOME = _Paths.WELCOME;
  static const BIRTHDAY = _Paths.BIRTHDAY;
  static const MAIN = _Paths.MAIN;
  static const NAVIGATOR = _Paths.NAVIGATOR;
  static const HOME = _Paths.HOME;
  static const SERVICE = _Paths.SERVICE;
  static const SERVICE_COMPONENT = _Paths.SERVICE_COMPONENT;
  static const CART = _Paths.CART;
  static const EVENT = _Paths.EVENT;
  static const LOCAL = _Paths.LOCAL;
  static const BILL = _Paths.BILL;
  static const FOLIO = _Paths.FOLIO;
}

abstract class _Paths {
  _Paths._();
  static const WELCOME = '/welcome';
  static const BIRTHDAY = '/birthday';
  static const MAIN = '/mainscreen';
  static const NAVIGATOR = '/navigator';
  static const HOME = '/homepage';
  static const SERVICE = '/service';
  static const SERVICE_COMPONENT = '/service-component/:cateId';
  static const CART = '/cart'; //add customer id to check
  static const EVENT = '/event';
  static const LOCAL = '/local';
  static const BILL = '/bill';
  static const FOLIO = '/folio';
}
