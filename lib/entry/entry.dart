import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mipha/entry/home.dart';

import '../i18n/core/localizations.dart';

class MiphaEntry extends StatelessWidget {
  const MiphaEntry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        CoreLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      title: 'Mipha',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      routes: {
        MiphaHome.route: (context) => const MiphaHome(),
      },
      initialRoute: MiphaHome.route,
    );
  }
}
