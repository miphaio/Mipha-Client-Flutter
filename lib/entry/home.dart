import 'package:flutter/material.dart';

import '../i18n/core/localizations.dart';
import '../routes/chat/chat.dart';

class MiphaHome extends StatefulWidget {
  static const String route = '/home';

  const MiphaHome({
    super.key,
  });

  @override
  State<MiphaHome> createState() => _MiphaHomeState();
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
            icon: const Icon(Icons.chat),
            label: coreLocalizations.getString('chat'),
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
    switch (_selectedIndex) {
      case 0:
        return Container();
      case 1:
        return const ChatView();
      case 2:
        return Container();
    }

    return Container();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
