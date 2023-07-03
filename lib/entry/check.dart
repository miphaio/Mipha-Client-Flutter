import 'package:bark/bark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mipha/entry/home.dart';
import 'package:mipha/util/authentication.dart';
import 'package:mipha/util/log.dart';

class MiphaCheck extends StatefulWidget {
  static const String route = '/check';

  const MiphaCheck({
    super.key,
  });

  @override
  State<MiphaCheck> createState() => _MiphaCheckState();
}

class _MiphaCheckState extends State<MiphaCheck> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulsingGrid(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _checkAuth() async {
    final BarkAuthenticationToken? authenticationToken =
        await barkAuthentication.ensureAuthenticationToken();

    if (authenticationToken == null) {
      logger.info('Authentication failed');
      return;
    }

    _navigateToIndexView();
  }

  void _navigateToIndexView() {
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, animation1, animation2) {
          return const MiphaHome();
        },
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
      (Route<dynamic> route) => false,
    );
  }
}
