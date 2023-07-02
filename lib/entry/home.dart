import 'package:flutter/material.dart';

import '../i18n/core/localizations.dart';

class MiphaHome extends StatefulWidget {
  static const String route = '/home';

  const MiphaHome({
    super.key,
  });

  @override
  _MiphaHomeState createState() => _MiphaHomeState();
}

class _MiphaHomeState extends State<MiphaHome> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: coreLocalizations.getText("core"),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: coreLocalizations.getString('history'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.group),
            label: coreLocalizations.getString('gather'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.brightness_2),
            label: coreLocalizations.getString('tools'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {}

    return Container();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
