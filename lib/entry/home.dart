import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mipha/i18n/core/localizations.dart';
import 'package:mipha/routes/chat/chat.dart';
import 'package:mipha/routes/debug/debug_center.dart';

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
        items: _buildNavigationBarItems(context),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavigationBarItems(BuildContext context) {
    final CoreLocalizations coreLocalizations = CoreLocalizations.of(context);

    final List<BottomNavigationBarItem> items = [
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
    ];

    if (kDebugMode) {
      items.add(
        BottomNavigationBarItem(
          icon: const Icon(Icons.bug_report),
          label: coreLocalizations.getString('debug'),
        ),
      );
    }

    return items;
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return Container();
      case 1:
        return const ChatView();
      case 2:
        return Container();
      case 3:
        return const DebugCenterView();
    }

    return Container();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
