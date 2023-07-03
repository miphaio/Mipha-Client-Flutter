import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mipha/i18n/localization_base.dart';

import 'core_en.dart';

class CoreLocalizations extends LocalizationBase {
  CoreLocalizations(Locale locale) : super(locale);

  static CoreLocalizations of(BuildContext context) {
    return Localizations.of<CoreLocalizations>(context, CoreLocalizations)!;
  }

  static var delegate = const _CoreLocalizationsDelegate();

  @override
  final Map<String, Map<String, String>> localizedValues = {
    'en': coreLocalizationEnglish,
  };
}

class _CoreLocalizationsDelegate
    extends LocalizationsDelegate<CoreLocalizations> {
  const _CoreLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<CoreLocalizations> load(Locale locale) {
    return SynchronousFuture<CoreLocalizations>(
      CoreLocalizations(locale),
    );
  }

  @override
  bool shouldReload(_CoreLocalizationsDelegate before) => false;
}
