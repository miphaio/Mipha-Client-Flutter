import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulsingGrid(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.amber : Colors.green,
              ),
            );
          },
        ),
      ),
    );
  }
}
