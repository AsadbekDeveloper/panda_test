// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get welcome => 'Добро пожаловать';

  @override
  String get chooseLanguage => 'Выберите язык приложения';

  @override
  String get continueButton => 'Продолжить';

  @override
  String get buyAndSellSafely => 'Покупай и продавай безопасно';

  @override
  String get projectForThePeople => 'Проект для народа';

  @override
  String get homePageTitle => 'Домашняя страница';

  @override
  String get welcomeToHomePage => 'Добро пожаловать на домашнюю страницу';

  @override
  String get allowLocationAccess => 'Разрешите доступ к геопозиции';

  @override
  String get locationAccessDescription =>
      'Так мы сможем показать интересные предложения и пункты выдачи-приёма рядом с вами';

  @override
  String get allowAccessButton => 'Разрешить доступ';

  @override
  String get specifyLocationButton => 'Указать местоположение';
}
