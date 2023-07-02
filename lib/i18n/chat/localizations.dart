import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'chat_en.dart';

class ChatLocalizations {
  final Locale locale;

  ChatLocalizations(this.locale);

  static ChatLocalizations of(BuildContext context) {
    return Localizations.of<ChatLocalizations>(context, ChatLocalizations)!;
  }

  static var delegate = const _ChatLocalizationsDelegate();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': chatLocalizationEnglish,
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

class _ChatLocalizationsDelegate
    extends LocalizationsDelegate<ChatLocalizations> {
  const _ChatLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<ChatLocalizations> load(Locale locale) {
    return SynchronousFuture<ChatLocalizations>(
      ChatLocalizations(locale),
    );
  }

  @override
  bool shouldReload(_ChatLocalizationsDelegate before) => false;
}
