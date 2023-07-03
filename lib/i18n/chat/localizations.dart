import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mipha/i18n/chat/chat_en.dart';
import 'package:mipha/i18n/localization_base.dart';

class ChatLocalizations extends LocalizationBase {
  ChatLocalizations(Locale locale) : super(locale);

  static ChatLocalizations of(BuildContext context) {
    return Localizations.of<ChatLocalizations>(context, ChatLocalizations)!;
  }

  static var delegate = const _ChatLocalizationsDelegate();

  @override
  final Map<String, Map<String, String>> localizedValues = {
    'en': chatLocalizationEnglish,
  };
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
