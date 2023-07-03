import 'package:bark/bark.dart';
import 'package:mipha/util/log.dart';

BarkAuthentication barkAuthentication = BarkAuthentication(
  authenticatorDomain: "bark.sh",
  targetDomain: "mipha.io",
  logLevel: logLevel,
);
