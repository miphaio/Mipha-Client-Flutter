import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core_en.dart';

class CoreLocalizations {
  final Locale locale;

  CoreLocalizations(this.locale);

  static CoreLocalizations of(BuildContext context) {
    return Localizations.of<CoreLocalizations>(context, CoreLocalizations)!;
  }

  static var delegate = const _CoreLocalizationsDelegate();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': coreLocalizationEnglish,
  };

  Map<String, String> get _stringMap {
    final Map<String, String>? map = _localizedValues[locale.languageCode];
    if (map == null) {
      return {};
    }
    return map;
  }

  String getString(
    String key, {
    Map<String, String>? replacements,
  }) {
    String? value = _stringMap[key];

    if (value == null) {
      if (replacements != null) {
        final List<String> replaced = [];

        for (String replacementKey in replacements.keys) {
          final String replacedValue = replacements[replacementKey]!;
          replaced.add("$replacementKey:$replacedValue");
        }
        return "[$key](${replaced.join(",")})";
      }
      return "[$key]";
    }

    if (replacements != null) {
      for (String replacementKey in replacements.keys) {
        value = value?.replaceFirst(
          "{$replacementKey}",
          replacements[replacementKey]!,
        );
      }
    }

    return value!;
  }

  Text getText(
    String key, {
    Map<String, String>? replacements,
    TextStyle? style,
  }) {
    return Text(
      getString(
        key,
        replacements: replacements,
      ),
      style: style,
    );
  }
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
