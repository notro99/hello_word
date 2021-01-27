import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'en.dart';
import 'hu.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  // Segédfüggvény, amivel a BuildContext-ből kikereshetjük a beregisztrált
  // PizzaAppLocalization példányt, amit a rendszer az épp aktuális nyelvvel
  // példányosít
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // Hozzárendeljük a nyelv kódjához a definiált szövegeket
  static Map<String, Map<String, String>> _localizedValues = {
    'en': ENGLISH_TEXTS,
    'hu': HUNGARIAN_TEXTS,
  };

  // Az aktuális nyelv alapján adjuk vissza  az azonosítóhoz tartozó
  // lefordított szöveget.
  String stringById(String id) => _localizedValues[locale.languageCode][id];

  // Az egyes azonosítókhoz metódust rendelünk
  String get addAddressDialogTitle => stringById('addAddressDialogTitle');
  String get addresses => stringById('addresses');
  String get addressSaved => stringById('addressSaved');
  String get addToCart => stringById('addToCart');
  String get cancel => stringById('cancel');
  String get canNotAccessToContacts => stringById('canNotAccessToContacts');
  String get cart => stringById('cart');
  String get cheeseBurst => stringById('cheeseBurst');
  String get chooseContact => stringById('chooseContact');
  String get city => stringById('city');
  String get crust => stringById('crust');
  String get details => stringById('details');
  String get email => stringById('email');
  String get enterYourEmail => stringById('enterYourEmail');
  String get enterYourName => stringById('enterYourName');
  String get enterYourPhone => stringById('enterYourPhone');
  String get extraCheese => stringById('extraCheese');
  String get extraSpice => stringById('extraSpice');
  String get garlicRoasted => stringById('garlicRoasted');
  String get houseNumber => stringById('houseNumber');
  String get large => stringById('large');
  String get mandatoryField => stringById('mandatoryField');
  String get medium => stringById('medium');
  String get name => stringById('name');
  String get phone => stringById('phone');
  String get profile => stringById('profile');
  String get profileSaved => stringById('profileSaved');
  String get save => stringById('save');
  String get size => stringById('size');
  String get small => stringById('small');
  String get standard => stringById('standard');
  String get street => stringById('street');
  String get takeAPicture => stringById('takeAPicture');
  String get todaySpecials => stringById('todaySpecials');
  String get toppings => stringById('toppings');
  String get total => stringById('total');
  String get unknown => stringById('unknown');
  String get whoWillEat => stringById('whoWillEat');
}

// Segédosztály, ami az aktuális nyelv alapján hoz létre egy
// PizzaAppLocalizations példányt, amit majd a widget-ekben elérhetünk
// a BuildContext-en keresztül
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hu'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(
      AppLocalizations(locale),
    );
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
