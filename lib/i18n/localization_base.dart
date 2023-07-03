import 'package:flutter/widgets.dart';

abstract class LocalizationBase {
  final Locale locale;

  LocalizationBase(this.locale);

  abstract final Map<String, Map<String, String>> localizedValues;

  Map<String, String> get stringMap {
    final Map<String, String>? map = localizedValues[locale.languageCode];

    if (map == null) {
      return {};
    }
    return map;
  }

  String getString(
    String key, {
    List<String>? replaces,
    Map<String, String>? keyedReplaces,
  }) {
    String? value = stringMap[key];

    if (value == null) {
      return "[$key]";
    }

    if (replaces != null) {
      for (int i = 0; i < replaces.length; i++) {
        value = value!.replaceFirst('{$i}', replaces[i]);
      }
    }

    if (keyedReplaces != null) {
      for (String key in keyedReplaces.keys) {
        value = value!.replaceFirst('{$key}', keyedReplaces[key]!);
      }
    }

    return value!;
  }

  Text getText(
    String key, {
    List<String>? replaces,
    Map<String, String>? keyedReplaces,
    TextStyle? style,
  }) {
    return Text(
      getString(
        key,
        replaces: replaces,
        keyedReplaces: keyedReplaces,
      ),
      style: style,
    );
  }
}
